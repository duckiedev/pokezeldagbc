IsAPokemon::
; Return carry if species a is not a Pokemon.
	and a
	jr z, .NotAPokemon
	cp EGG
	jr z, .Pokemon
	cp NUM_POKEMON + 1
	jr c, .Pokemon

.NotAPokemon:
	scf
	ret

.Pokemon:
	and a
	ret

DrawBattleHPBar::
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels

	push hl
	push de
	push bc

; Place '-'
	ld a, [wBattleMode]
	dec a
	jr nz, .template_start
	ld a, $6B
	ld [hli], a

; Draw a template
.template_start
	push hl
	ld a, $62 ; empty bar
.template
	ld [hli], a
	dec d
	jr nz, .template
	ld a, [hl]			; skip redrawing "-" for player's hud
	cp $bb				; if it's already part of the exp bar
	jr z, .skip
	ld a, [wBattleMode]
	dec a
	jr nz, .skip
	ld a, $6B ; bar end
	ld [hl], a
.skip
	pop hl

; Safety check # pixels
	ld a, e
	and a
	jr nz, .fill
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
; Keep drawing tiles until pixel length is reached
	ld a, e
	sub TILE_WIDTH
	jr c, .lastbar

	ld e, a
	ld a, $6a ; full bar
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.lastbar
	ld a, $62  ; empty bar
	add e      ; + e
	ld [hl], a

.done
	pop bc
	pop de
	pop hl
	ret

DrawEXPBarFrame::
	push de
	ld de, SCREEN_WIDTH
	ld a, $BC
	ld [hli], a 

	; top
	inc a
	ld [hld], a

	; left edge 1
	add hl, de
	ld [hl], $C0

	; left edge 2
	add hl, de
	ld [hl], $C0

	; left edge hp bar
	add hl, de
	ld [hl], $BB

	; bottom-left tile
	add hl, de
	ld a, $BE
	ld [hli], a

	; bottom
	inc a
	ld [hl], a

	pop de
	ret

PrepMonFrontpic::
	ld a, $1
	ld [wBoxAlignment], a

_PrepMonFrontpic::
	ld a, [wCurPartySpecies]
	call IsAPokemon
	jr c, .not_pokemon

	push hl
	ld de, vTiles2
	predef GetMonFrontpic
	pop hl
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wBoxAlignment], a
	ret

.not_pokemon
	xor a
	ld [wBoxAlignment], a
	inc a
	ld [wCurPartySpecies], a
	ret

PlayStereoCry::
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	call _PlayMonCry
	call WaitSFX
	ret

PlayStereoCry2::
; Don't wait for the cry to end.
; Used during pic animations.
	push af
	ld a, 1
	ld [wStereoPanningMask], a
	pop af
	jp _PlayMonCry

PlayMonCry::
	call PlayMonCry2
	call WaitSFX
	ret

PlayMonCry2::
; Don't wait for the cry to end.
	push af
	xor a
	ld [wStereoPanningMask], a
	ld [wCryTracks], a
	pop af
	call _PlayMonCry
	ret

_PlayMonCry::
	push hl
	push de
	push bc

	call GetCryIndex
	jr c, .done

	ld e, c
	ld d, b
	call PlayCry

.done
	pop bc
	pop de
	pop hl
	ret

LoadCry::
; Load cry bc.

	call GetCryIndex
	ret c

	ldh a, [hROMBank]
	push af
	ld a, BANK(PokemonCries)
	rst Bankswitch

	ld hl, PokemonCries
rept MON_CRY_LENGTH
	add hl, bc
endr

	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a

	pop af
	rst Bankswitch
	and a
	ret

GetCryIndex::
	and a
	jr z, .no
	cp NUM_POKEMON + 1
	jr nc, .no

	dec a
	ld c, a
	ld b, 0
	and a
	ret

.no
	scf
	ret

PrintLevel::
; Print wTempMonLevel at hl

	ld a, [wTempMonLevel]
	ld [hl], "<LV>"
	inc hl

; How many digits?
	ld c, 2
	cp 100 ; This is distinct from MAX_LEVEL.
	jr c, Print8BitNumLeftAlign

; 3-digit numbers overwrite the :L.
	dec hl
	inc c
	jr Print8BitNumLeftAlign

PrintLevel_Force3Digits::
; Print :L and all 3 digits
	ld [hl], "<LV>"
	inc hl
	ld c, 3

Print8BitNumLeftAlign::
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	ld b, PRINTNUM_LEFTALIGN | 1
	jp PrintNum

GetBaseData::
	push bc
	push de
	push hl
	ldh a, [hROMBank]
	push af
	ld a, BANK(BaseData)
	rst Bankswitch

	ld a, [wCurSpecies]

; Get BaseData
	dec a
	ld bc, BASE_DATA_SIZE
	ld hl, BaseData
	call AddNTimes
	ld de, wCurBaseData
	ld bc, BASE_DATA_SIZE
	call CopyBytes

; Replace Pokedex # with species
	ld a, [wCurSpecies]
	ld [wBaseDexNo], a

	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret

GetCurNickname::
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames

GetNickname::
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, wStringBuffer1

	push de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop de

	callfar CorrectNickErrors

	pop bc
	pop hl
	ret

DrawPlayerHearts::
	ld a, [wBattleMonMaxHearts]
	ld c, a ; Store max hearts in c
	ld a, [wBattleMonHearts]
	ld b, a ; Store current hearts in b
	hlcoord 10, 9
	jr HeartDrawLoop

DrawEnemyHearts::
	ld a, [wEnemyMonMaxHearts]
	ld c, a ; Store max hearts in c
	ld a, [wEnemyMonHearts]
	ld b, a ; Store current hearts in b

	; Set the starting coordinate
	hlcoord 1, 1

; while (b != 0)
HeartDrawLoop:
    ld a, c
    or a
    ret z

    ; Check if current hearts are greater than zero
    ld a, b
    or a
    jr z, .empty_heart ; Jump to empty heart if b is 0

    ; Draw full heart
    ld a, $60 ; Full heart tile
    ld [hli], a
    dec b ; Decrement current hearts
    jr .decrement_c

.empty_heart
    ; Draw empty heart
    ld a, $61 ; Empty heart tile
    ld [hli], a

.decrement_c
    dec c ; Decrement max hearts
    jr HeartDrawLoop

DrawBossIcon::
	ld a, $70
	hlcoord 0, 0
	ld [hl], a
	ret