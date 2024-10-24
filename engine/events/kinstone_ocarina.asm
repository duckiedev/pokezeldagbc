OcarinaFunction:
    ld hl, Script_OcarinaFromMenu
    jmp QueueScript

Script_OcarinaFromMenu:
    refreshmap
	loadmem hBGMapMode, $0
	special UpdateTimePals
	callasm LoadOcarinaGFX
	applymovement PLAYER, MovementData_PlayOcarina
Script_Ocarina:
    special FadeOutMusic
    ;opentext
    ; display Notation graphics
    callasm InitOcarina
    ; if played a known song, go to the thing it should do (Song pointers and memory)
    ; if didn't play a known song, start over HERE
    ; if player cancelled out of it, close text.
    refreshmap
    callasm PutTheRodAway
	applymovement PLAYER, MovementData_PlayOcarina
    special RestartMapMusic
    end

MovementData_PlayOcarina:
    play_ocarina
    step_end

InitOcarina:
    xor a
	ldh [hBGMapMode], a
    ; textbox
	hlcoord 1, 1
	lb bc, 4, 16
	call Textbox
    ; music note
	hlcoord 2, 2
	ld de, .music_note
	call PlaceString

	;call UpdateSprites
	call CGBOnly_CopyTilemapAtOnce
    ; initialize song wram
    ld a, "@"
    ld [wOcarinaTempNotes], a
    call DelayFrame
.loop
	ld de, wOcarinaTempNotes
	hlcoord 4, 2
	call PlaceString
	;call UpdateSprites
	call CGBOnly_CopyTilemapAtOnce
    call .GetDPad
    jr nc, .loop
    jmp ClearJoypad
.GetDPad:
    call JoyTextDelay
    ld hl, hJoyPressed
    ld a, [hl]
    and A_BUTTON
    jr nz, .a
    ld a, [hl]
    and D_UP
    jr nz, .up
    ld a, [hl]
    and D_DOWN
    jr nz, .down
    ld a, [hl]
    and D_LEFT
    jr nz, .left
    ld a, [hl]
    and D_RIGHT
    jr nz, .right
    ld a, [hl]
    and B_BUTTON
    jr nz, .b
    ret

.a
    ld b, "<A>"
    call AddCharToOcarina
    ld de, MUSIC_OCARINA_NOTE_B4
    jmp PlayMusic

.b
    scf
    ret 

.right
    ld b, "<RIGHT>"
    call AddCharToOcarina
    ld de, MUSIC_OCARINA_NOTE_A5
    jmp PlayMusic

.left
    ld b, "<LEFT>"
    call AddCharToOcarina
    ld de, MUSIC_OCARINA_NOTE_F5
    jmp PlayMusic

.down
    ld b, "<DOWN>"
    call AddCharToOcarina
    ld de, MUSIC_OCARINA_NOTE_D5
    jmp PlayMusic

.up
    ld b, "<UP>"
    call AddCharToOcarina
    ld de, MUSIC_OCARINA_NOTE_B5
    jmp PlayMusic

.music_note
    db "<NOTE>@"

AddCharToOcarina:
    push bc
    ld hl, wOcarinaTempNotes + OCARINA_MAX_SONG_LENGTH
    ; scenario 1
    ; [hl + 7] = "@" | bytefill 0 for all bytes, write "@" at [hl], then run scenario 2
    ld a, [hl]
    cp "@"
    jr z, ResetOcarina
; fallthrough
AddChar:
    ld hl, wOcarinaTempNotes
    call FindEnd
    dec hl
    ld a, b
    ld [hli], a
    ld a, "@"
    ld [hl], a
    pop bc
    ret

FindEnd:
    ld a, [hli]
    cp "@"
    jr nz, FindEnd
    ret

; If we reach here, it means the song length has reached the max
ResetOcarina:
    push bc
    ld hl, wOcarinaTempNotes
	ld bc, OCARINA_MAX_SONG_LENGTH + 1
	xor a
	call ByteFill
    ld a, "@"
    ld hl, wOcarinaTempNotes
    ld [hl], a
	ld de, .reset_characters
	hlcoord 4, 2
	call PlaceString
    pop bc
    jr AddChar
.reset_characters
    db "      @"

LoadOcarinaGFX:
    ldh a, [rVBK]
    push af
    ld a, $1
    ldh [rVBK], a

    ld de, OcarinaGFX
    ld a, [wPlayerGender]
    bit PLAYERGENDER_FEMALE_F, a
    jr z, .got_gender
    ld de, KrisOcarinaGFX
.got_gender

    ld hl, vTiles0 tile $02
    call .LoadGFX
    ld hl, vTiles0 tile $06
    call .LoadGFX
    ld hl, vTiles0 tile $0a
    call .LoadGFX
    ld hl, vTiles0 tile $fc
    call .LoadGFX

    pop af
    ldh [rVBK], a
    ret

.LoadGFX:
    lb bc, BANK(OcarinaGFX), 2
    push de
    call Get2bpp
    pop de
    ld hl, 2 tiles
    add hl, de
    ld d, h
    ld e, l
    ret

OcarinaGFX:
INCBIN "gfx/overworld/chris_ocarina.2bpp"

KrisOcarinaGFX:
INCBIN "gfx/overworld/kris_ocarina.2bpp"
