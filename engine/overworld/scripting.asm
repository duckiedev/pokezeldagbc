; Event scripting commands.

EnableScriptMode::
	push af
	ld a, SCRIPT_READ
	ld [wScriptMode], a
	pop af
	ret

ScriptEvents::
	call StartScript
.loop
	ld a, [wScriptMode]
	ld hl, .modes
	rst JumpTable
	call CheckScript
	jr nz, .loop
	ret

.modes
	dw EndScript
	dw RunScriptCommand
	dw WaitScriptMovement
	dw WaitScript

EndScript:
 	jmp StopScript

WaitScript:
	call StopScript

	ld hl, wScriptDelay
	dec [hl]
	ret nz

	farcall UnfreezeAllObjects

	ld a, SCRIPT_READ
	ld [wScriptMode], a
 	jmp StartScript

WaitScriptMovement:
	call StopScript

	ld hl, wStateFlags
	bit SCRIPTED_MOVEMENT_STATE_F, [hl]
	ret nz

	farcall UnfreezeAllObjects

	ld a, SCRIPT_READ
	ld [wScriptMode], a
 	jmp StartScript

RunScriptCommand:
	call GetScriptByte
	ld hl, ScriptCommandTable
	rst JumpTable
	ret

ScriptCommandTable:
; entries correspond to *_command constants (see macros/scripts/events.asm)
	table_width 2, ScriptCommandTable
	dw Script_scall                      ; 00
	dw Script_farscall                   ; 01
	dw Script_memcall                    ; 02
	dw Script_sjump                      ; 03
	dw Script_farsjump                   ; 04
	dw Script_memjump                    ; 05
	dw Script_ifequal                    ; 06
	dw Script_ifnotequal                 ; 07
	dw Script_iffalse                    ; 08
	dw Script_iftrue                     ; 09
	dw Script_ifgreater                  ; 0a
	dw Script_ifless                     ; 0b
	dw Script_jumpstd                    ; 0c
	dw Script_callstd                    ; 0d
	dw Script_callasm                    ; 0e
	dw Script_special                    ; 0f
	dw Script_memcallasm                 ; 10
	dw Script_checkmapscene              ; 11
	dw Script_setmapscene                ; 12
	dw Script_checkscene                 ; 13
	dw Script_setscene                   ; 14
	dw Script_setval                     ; 15
	dw Script_addval                     ; 16
	dw Script_random                     ; 17
	dw Script_checkver                   ; 18
	dw Script_readmem                    ; 19
	dw Script_writemem                   ; 1a
	dw Script_loadmem                    ; 1b
	dw Script_readvar                    ; 1c
	dw Script_writevar                   ; 1d
	dw Script_loadvar                    ; 1e
	dw Script_giveitem                   ; 1f
	dw Script_takeitem                   ; 20
	dw Script_checkitem                  ; 21
	dw Script_givemoney                  ; 22
	dw Script_takemoney                  ; 23
	dw Script_checkmoney                 ; 24
	dw Script_givecoins                  ; 25
	dw Script_takecoins                  ; 26
	dw Script_checkcoins                 ; 27
	dw Script_checktime                  ; 28
	dw Script_checkpoke                  ; 29
	dw Script_givepoke                   ; 2a
	dw Script_checkevent                 ; 2b
	dw Script_clearevent                 ; 2c
	dw Script_setevent                   ; 2d
	dw Script_checkflag                  ; 2e
	dw Script_clearflag                  ; 2f
	dw Script_setflag                    ; 30
	dw Script_wildon                     ; 31
	dw Script_wildoff                    ; 32
	dw Script_xycompare                  ; 33
	dw Script_warpmod                    ; 34
	dw Script_blackoutmod                ; 35
	dw Script_warp                       ; 36
	dw Script_getmoney                   ; 37
	dw Script_getcoins                   ; 38
	dw Script_getnum                     ; 39
	dw Script_getmonname                 ; 3a
	dw Script_getitemname                ; 3b
	dw Script_getcurlandmarkname         ; 3c
	dw Script_gettrainername             ; 3d
	dw Script_getstring                  ; 3e
	dw Script_itemnotify                 ; 3f
	dw Script_pocketisfull               ; 40
	dw Script_opentext                   ; 41
	dw Script_reanchormap                ; 42
	dw Script_closetext                  ; 43
	dw Script_writeunusedbyte            ; 44
	dw Script_farwritetext               ; 45
	dw Script_writetext                  ; 46
	dw Script_repeattext                 ; 47
	dw Script_yesorno                    ; 48
	dw Script_loadmenu                   ; 49
	dw Script_closewindow                ; 4a
	dw Script_jumptextfaceplayer         ; 4b
	dw Script_farjumptext                ; 4c
	dw Script_jumptext                   ; 4d
	dw Script_waitbutton                 ; 4e
	dw Script_promptbutton               ; 4f
	dw Script_pokepic                    ; 50
	dw Script_closepokepic               ; 51
	dw Script__2dmenu                    ; 52
	dw Script_verticalmenu               ; 53
	dw Script_loadpikachudata            ; 54
	dw Script_randomwildmon              ; 55
	dw Script_loadtemptrainer            ; 56
	dw Script_loadwildmon                ; 57
	dw Script_loadtrainer                ; 58
	dw Script_startbattle                ; 59
	dw Script_reloadmapafterbattle       ; 5a
	dw Script_trainertext                ; 5b
	dw Script_trainerflagaction          ; 5c
	dw Script_winlosstext                ; 5d
	dw Script_scripttalkafter            ; 5e
	dw Script_endifjustbattled           ; 5f
	dw Script_checkjustbattled           ; 60
	dw Script_setlasttalked              ; 61
	dw Script_applymovement              ; 62
	dw Script_applymovementlasttalked    ; 63
	dw Script_faceplayer                 ; 64
	dw Script_faceobject                 ; 65
	dw Script_variablesprite             ; 66
	dw Script_disappear                  ; 67
	dw Script_appear                     ; 68
	dw Script_follow                     ; 69
	dw Script_stopfollow                 ; 6a
	dw Script_moveobject                 ; 6b
	dw Script_writeobjectxy              ; 6c
	dw Script_loademote                  ; 6d
	dw Script_showemote                  ; 6e
	dw Script_turnobject                 ; 6f
	dw Script_follownotexact             ; 70
	dw Script_earthquake                 ; 71
	dw Script_changemapblocks            ; 72
	dw Script_changeblock                ; 73
	dw Script_reloadmap                  ; 74
	dw Script_refreshmap                 ; 75
	dw Script_writecmdqueue              ; 76
	dw Script_delcmdqueue                ; 77
	dw Script_playmusic                  ; 78
	dw Script_encountermusic             ; 79
	dw Script_musicfadeout               ; 7a
	dw Script_playmapmusic               ; 7b
	dw Script_dontrestartmapmusic        ; 7c
	dw Script_cry                        ; 7d
	dw Script_playsound                  ; 7e
	dw Script_waitsfx                    ; 7f
	dw Script_warpsound                  ; 80
	dw Script_specialsound               ; 81
	dw Script_autoinput                  ; 82
	dw Script_newloadmap                 ; 83
	dw Script_pause                      ; 84
	dw Script_deactivatefacing           ; 85
	dw Script_sdefer                     ; 86
	dw Script_warpcheck                  ; 87
	dw Script_stopandsjump               ; 88
	dw Script_endcallback                ; 89
	dw Script_end                        ; 8a
	dw Script_reloadend                  ; 8b
	dw Script_endall                     ; 8c
	dw Script_pokemart                   ; 8d
	dw Script_elevator                   ; 8e
	dw Script_trade                      ; 8f
	dw Script_fruittree                  ; 90
	dw Script_verbosegiveitem            ; 91
	dw Script_verbosegiveitemvar         ; 92
	dw Script_swarm                      ; 93
	dw Script_halloffame                 ; 94
	dw Script_credits                    ; 95
	dw Script_warpfacing                 ; 96
	dw Script_getlandmarkname            ; 97
	dw Script_gettrainerclassname        ; 98
	dw Script_getname                    ; 99
	dw Script_wait                       ; 9a
	dw Script_checksave                  ; 9b
	dw Script_owmonflagaction            ; 9c
	dw Script_owmonafterbattle           ; 9d
	assert_table_length NUM_EVENT_COMMANDS

StartScript:
	ld hl, wScriptFlags
	set SCRIPT_RUNNING, [hl]
	ret

CheckScript:
	ld hl, wScriptFlags
	bit SCRIPT_RUNNING, [hl]
	ret

StopScript:
	ld hl, wScriptFlags
	res SCRIPT_RUNNING, [hl]
	ret

Script_callasm:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, b
	rst FarCall
	ret

Script_special:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	farcall Special
	ret

Script_memcallasm:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret

Script_jumptextfaceplayer:
	ld a, [wScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextFacePlayerScript)
	ld hl, JumpTextFacePlayerScript
 	jmp ScriptJump

Script_jumptext:
	ld a, [wScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
 	jmp ScriptJump

JumpTextFacePlayerScript:
	faceplayer
JumpTextScript:
	opentext
	repeattext -1, -1
	waitbutton
	closetext
	end

Script_farjumptext:
	call GetScriptByte
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
 	jmp ScriptJump

Script_writetext:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	ld b, a
 	jmp MapTextbox

Script_farwritetext:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
 	jmp MapTextbox

Script_repeattext:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	cp -1
	ret nz
	ld a, l
	cp -1
	ret nz
	ld hl, wScriptTextBank
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
 	jmp MapTextbox

Script_waitbutton:
 	jmp WaitButton

Script_promptbutton:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	call PromptButton
	pop af
	ldh [hOAMUpdate], a
	ret

Script_yesorno:
	call YesNoBox
	ld a, FALSE
	jr c, .no
	ld a, TRUE
.no
	ld [wScriptVar], a
	vc_hook Unknown_yesorno_ret
	ret

Script_loadmenu:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld de, LoadMenuHeader
	ld a, [wScriptBank]
	call Call_a_de
 	jmp UpdateSprites

Script_closewindow:
	call CloseWindow
 	jmp UpdateSprites

Script_pokepic:
	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wCurPartySpecies], a
	farcall Pokepic
	ret

Script_closepokepic:
	farcall ClosePokepic
	ret

Script_verticalmenu:
	ld a, [wScriptBank]
	ld hl, VerticalMenu
	rst FarCall
	ld a, [wMenuCursorY]
	jr nc, .ok
	xor a
.ok
	ld [wScriptVar], a
	ret

Script__2dmenu:
	ld a, [wScriptBank]
	ld hl, _2DMenu
	rst FarCall
	ld a, [wMenuCursorPosition]
	jr nc, .ok
	xor a
.ok
	ld [wScriptVar], a
	ret

Script_verbosegiveitem:
	call Script_giveitem
	call CurItemName
	ld de, wStringBuffer1
	ld a, STRING_BUFFER_4
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
 	jmp ScriptCall

GiveItemScript:
	writetext .ReceivedItemText
	iffalse .Full
	waitsfx
	specialsound
	waitbutton
	itemnotify
	end

.Full:
	promptbutton
	pocketisfull
	end

.ReceivedItemText:
	text_far _ReceivedItemText
	text_end

Script_verbosegiveitemvar:
	call GetScriptByte
	cp ITEM_FROM_MEM
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wCurItem], a
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	ld a, TRUE
	jr c, .ok2
	xor a
.ok2
	ld [wScriptVar], a
	call CurItemName
	ld de, wStringBuffer1
	ld a, STRING_BUFFER_4
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
 	jmp ScriptCall

Script_itemnotify:
	call GetPocketName
	call CurItemName
	ld b, BANK(PutItemInPocketText)
	ld hl, PutItemInPocketText
 	jmp MapTextbox

Script_pocketisfull:
	call GetPocketName
	call CurItemName
	ld b, BANK(PocketIsFullText)
	ld hl, PocketIsFullText
 	jmp MapTextbox

Script_specialsound:
	farcall CheckItemPocket
	ld a, [wItemAttributeValue]
	cp TM_HM
	ld de, SFX_GET_TM
	jr z, .play
	ld de, SFX_ITEM
.play
	call PlaySFX
 	jmp WaitSFX

GetPocketName:
	farcall CheckItemPocket
	ld a, [wItemAttributeValue]
	dec a
	ld hl, ItemPocketNames
	maskbits NUM_POCKETS
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, wStringBuffer3
 	jmp CopyName2

INCLUDE "data/items/pocket_names.asm"

CurItemName:
	ld a, [wCurItem]
	ld [wNamedObjectIndex], a
 	jmp GetItemName

PutItemInPocketText:
	text_far _PutItemInPocketText
	text_end

PocketIsFullText:
	text_far _PocketIsFullText
	text_end

Script_pokemart:
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret

Script_elevator:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
	farcall Elevator
	ret c
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_trade:
	call GetScriptByte
	ld e, a
	farcall NPCTrade
	ret

Script_fruittree:
	call GetScriptByte
	ld [wCurFruitTree], a
	ld b, BANK(FruitTreeScript)
	ld hl, FruitTreeScript
 	jmp ScriptJump

Script_swarm:
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld d, a
	call GetScriptByte
	ld e, a
	farcall StoreSwarmMapIndices
	ret

Script_trainertext:
	call GetScriptByte
	ld c, a
	ld b, 0
	ld hl, wSeenTextPointer
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSeenTrainerBank]
	ld b, a
 	jmp MapTextbox

Script_scripttalkafter:
	ld hl, wScriptAfterPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSeenTrainerBank]
	ld b, a
 	jmp ScriptJump

Script_trainerflagaction:
	xor a
	ld [wScriptVar], a
	ld hl, wTempTrainerEventFlag
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	ld b, a
	call EventFlagAction
	ld a, c
	and a
	ret z
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_winlosstext:
	ld hl, wWinTextPointer
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ld hl, wLossTextPointer
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ret

Script_endifjustbattled:
	ld a, [wRunningTrainerBattleScript]
	and a
	ret z
 	jmp Script_end

Script_checkjustbattled:
	ld a, TRUE
	ld [wScriptVar], a
	ld a, [wRunningTrainerBattleScript]
	and a
	ret nz
	xor a
	ld [wScriptVar], a
	ret

Script_encountermusic:
	ld a, [wOtherTrainerClass]
	ld e, a
	farcall PlayTrainerEncounterMusic
	ret

Script_playmapmusic:
 	jmp PlayMapMusic

Script_playmusic:
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wMusicFade], a
	call MaxVolume
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
 	jmp PlayMusic

Script_musicfadeout:
	call GetScriptByte
	ld [wMusicFadeID], a
	call GetScriptByte
	ld [wMusicFadeID + 1], a
	call GetScriptByte
	and ~(1 << MUSIC_FADE_IN_F)
	ld [wMusicFade], a
	ret

Script_playsound:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
 	jmp PlaySFX

Script_waitsfx:
 	jmp WaitSFX

Script_warpsound:
	farcall GetWarpSFX
 	jmp PlaySFX

Script_cry:
	call GetScriptByte
	push af
	call GetScriptByte
	pop af
	and a
	jr nz, .ok
	ld a, [wScriptVar]
.ok
 	jmp PlayMonCry

GetScriptObject:
	and a ; PLAYER?
	ret z
	cp LAST_TALKED
	ret z
	dec a
	ret

Script_setlasttalked:
	call GetScriptByte
	call GetScriptObject
	ldh [hLastTalked], a
	ret

Script_applymovement:
	call GetScriptByte
	call GetScriptObject
	ld c, a

ApplyMovement:
	push bc
	ld a, c
	farcall FreezeAllOtherObjects
	pop bc

	push bc
	call UnfreezeFollowerObject
	pop bc

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	ld b, a
	call GetMovementData
	ret c

	ld a, SCRIPT_WAIT_MOVEMENT
	ld [wScriptMode], a
    jmp StopScript

UnfreezeFollowerObject:
	farcall _UnfreezeFollowerObject
	ret

Script_applymovementlasttalked:
; apply movement to last talked

	ldh a, [hLastTalked]
	ld c, a
	jr ApplyMovement

Script_faceplayer:
	ldh a, [hLastTalked]
	and a
	ret z
	ld d, $0
	ldh a, [hLastTalked]
	ld e, a
	farcall GetRelativeFacing
	ld a, d
	add a
	add a
	ld e, a
	ldh a, [hLastTalked]
	ld d, a
	jr ApplyObjectFacing

Script_faceobject:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr c, .ok
	ldh a, [hLastTalked]
.ok
	ld e, a
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok2
	ldh a, [hLastTalked]
.ok2
	ld d, a
	push de
	farcall GetRelativeFacing
	pop bc
	ret c
	ld a, d
	add a
	add a
	ld e, a
	ld d, c
	jr ApplyObjectFacing

Script_turnobject:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok
	ldh a, [hLastTalked]
.ok
	ld d, a
	call GetScriptByte
	add a
	add a
	ld e, a
	jr ApplyObjectFacing

ApplyObjectFacing:
	ld a, d
	push de
	call CheckObjectVisibility
	jr c, .not_visible
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	push bc
	call DoesSpriteHaveFacings
	pop bc
	jr c, .not_visible ; STILL_SPRITE
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit FIXED_FACING_F, [hl]
	jr nz, .not_visible
	pop de
	ld a, e
	call SetSpriteDirection
	ld hl, wStateFlags
	bit TEXT_STATE_F, [hl]
	jr nz, .text_state
	call .DisableTextTiles
.text_state
 	jmp UpdateSprites

.not_visible
	pop de
	scf
	ret

.DisableTextTiles:
	call LoadOverworldTilemap
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	res 7, [hl]
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Script_variablesprite:
	call GetScriptByte
	ld e, a
	ld d, 0
	ld [hUsedSpriteIndex], a
	ld hl, wVariableSprites
	add hl, de
	call GetScriptByte
	ld [hl], a
	farcall ReloadSpriteIndex
	ret

Script_appear:
	call GetScriptByte
	call GetScriptObject
	call UnmaskCopyMapObjectStruct
	ldh a, [hMapObjectIndex]
	ld b, 0 ; clear
	jr ApplyEventActionAppearDisappear

Script_disappear:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok
	ldh a, [hLastTalked]
.ok
	call DeleteObjectStruct
	ldh a, [hMapObjectIndex]
	ld b, 1 ; set
	call ApplyEventActionAppearDisappear
	farcall _UpdateSprites
	ret

ApplyEventActionAppearDisappear:
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_EVENT_FLAG
	add hl, bc
	pop bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, -1
	cp e
	jr nz, .okay
	cp d
	jr nz, .okay
	xor a
	ret
.okay
 	jmp EventFlagAction

Script_follow:
	call GetScriptByte
	call GetScriptObject
	ld b, a
	call GetScriptByte
	call GetScriptObject
	ld c, a
	farcall StartFollow
	ret

Script_stopfollow:
	farcall StopFollow
	ret

Script_moveobject:
	call GetScriptByte
	call GetScriptObject
	ld b, a
	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	farcall CopyDECoordsToMapObject
	ret

Script_writeobjectxy:
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr nz, .ok
	ldh a, [hLastTalked]
.ok
	ld b, a
	farcall WriteObjectXY
	ret

Script_follownotexact:
	call GetScriptByte
	call GetScriptObject
	ld b, a
	call GetScriptByte
	call GetScriptObject
	ld c, a
	farcall FollowNotExact
	ret

Script_loademote:
	call GetScriptByte
	cp EMOTE_FROM_MEM
	jr nz, .not_var_emote
	ld a, [wScriptVar]
.not_var_emote
	ld c, a
	farcall LoadEmote
	ret

Script_showemote:
	call GetScriptByte
	ld [wScriptVar], a
	call GetScriptByte
	call GetScriptObject
	cp LAST_TALKED
	jr z, .ok
	ldh [hLastTalked], a
.ok
	call GetScriptByte
	ld [wScriptDelay], a
	ld b, BANK(ShowEmoteScript)
	ld de, ShowEmoteScript
 	jmp ScriptCall

ShowEmoteScript:
	loademote EMOTE_FROM_MEM
	applymovementlasttalked .Show
	pause 0
	applymovementlasttalked .Hide
	end

.Show:
	show_emote
	step_sleep 1
	step_end

.Hide:
	hide_emote
	step_sleep 1
	step_end

Script_earthquake:
	ld hl, EarthquakeMovement
	ld de, wEarthquakeMovementDataBuffer
	ld bc, EarthquakeMovement.End - EarthquakeMovement
	call CopyBytes
	call GetScriptByte
	ld [wEarthquakeMovementDataBuffer + 1], a
	and %00111111
	ld [wEarthquakeMovementDataBuffer + 3], a
	ld b, BANK(.script)
	ld de, .script
 	jmp ScriptCall

.script
	applymovement PLAYER, wEarthquakeMovementDataBuffer
	end

EarthquakeMovement:
	step_shake 16 ; the 16 gets overwritten with the script byte
	step_sleep 16 ; the 16 gets overwritten with the lower 6 bits of the script byte
	step_end
.End

Script_loadpikachudata:
	ret

Script_randomwildmon:
	xor a
	ld [wBattleScriptFlags], a
	ret

Script_loadtemptrainer:
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	ld a, [wTempTrainerClass]
	ld [wOtherTrainerClass], a
	ld a, [wTempTrainerID]
	ld [wOtherTrainerID], a
	ret

Script_owmonflagaction:
	xor a
	ld [wScriptVar], a
	ld hl, wTempOWMonEventFlag
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	ld b, a
	call EventFlagAction
	ld a, c
	and a
	ret z
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_owmonafterbattle:
	ld hl, wTempOWMonAfterBattleScript
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSeenOWMonBank]
	ld b, a
 	jmp ScriptJump
 
Script_loadwildmon:
	ld a, (1 << 7)
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [wTempWildMonSpecies], a
	call GetScriptByte
	ld [wCurPartyLevel], a
	ret

Script_loadtrainer:
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [wOtherTrainerClass], a
	call GetScriptByte
	ld [wOtherTrainerID], a
	ret

Script_startbattle:
	call BufferScreen
	predef StartBattle
	ld a, [wBattleResult]
	and ~BATTLERESULT_BITMASK
	ld [wScriptVar], a
	ret

Script_reloadmapafterbattle:
	ld hl, wBattleScriptFlags
	ld d, [hl]
	ld [hl], 0
	ld a, [wBattleResult]
	and ~BATTLERESULT_BITMASK
	cp LOSE
	jr nz, .notblackedout
	ld b, BANK(Script_BattleWhiteout)
	ld hl, Script_BattleWhiteout
 	jmp ScriptJump

.notblackedout
	bit 0, d
	jr z, .was_wild
	jr .done

.was_wild
	ld a, [wBattleResult]
	bit BATTLERESULT_BOX_FULL, a

.done
	jr Script_reloadmap

Script_reloadmap:
	xor a
	ld [wBattleScriptFlags], a
	ld a, MAPSETUP_RELOADMAP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
 	jmp StopScript

Script_scall:
	ld a, [wScriptBank]
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall

Script_farscall:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall

Script_memcall:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	; fallthrough

ScriptCall:

	ld hl, wScriptStackSize
	ld a, [hl]
	cp 5
	ret nc

	push de
	inc [hl]
	ld e, a
	ld d, 0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [wScriptBank]
	ld [hli], a
	ld a, [wScriptPos]
	ld [hli], a
	ld a, [wScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [wScriptBank], a
	ld a, e
	ld [wScriptPos], a
	ld a, d
	ld [wScriptPos + 1], a
	ret

CallCallback::
	ld a, [wScriptBank]
	or $80
	ld [wScriptBank], a
	jr ScriptCall

Script_sjump:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptBank]
	ld b, a
 	jmp ScriptJump

Script_farsjump:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	jr ScriptJump

Script_memjump:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr ScriptJump

Script_iffalse:
	ld a, [wScriptVar]
	and a
	jr nz, SkipTwoScriptBytes
	jr Script_sjump

Script_iftrue:
	ld a, [wScriptVar]
	and a
	jr nz, Script_sjump
	jr SkipTwoScriptBytes

Script_ifequal:
	call GetScriptByte
	ld hl, wScriptVar
	cp [hl]
	jr z, Script_sjump
	jr SkipTwoScriptBytes

Script_ifnotequal:
	call GetScriptByte
	ld hl, wScriptVar
	cp [hl]
	jr nz, Script_sjump
	jr SkipTwoScriptBytes

Script_ifgreater:
	ld a, [wScriptVar]
	ld b, a
	call GetScriptByte
	cp b
	jr c, Script_sjump
	jr SkipTwoScriptBytes

Script_ifless:
	call GetScriptByte
	ld b, a
	ld a, [wScriptVar]
	cp b
	jr c, Script_sjump
	jr SkipTwoScriptBytes

Script_jumpstd:
	call StdScript
	jr ScriptJump

Script_callstd:
	call StdScript
	ld d, h
	ld e, l
 	jmp ScriptCall

StdScript:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld hl, StdScripts
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(StdScripts)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(StdScripts)
    jmp GetFarWord

SkipTwoScriptBytes:
	call GetScriptByte
 	jmp GetScriptByte

ScriptJump:
	ld a, b
	ld [wScriptBank], a
	ld a, l
	ld [wScriptPos], a
	ld a, h
	ld [wScriptPos + 1], a
	ret

Script_sdefer:
	ld a, [wScriptBank]
	ld [wDeferredScriptBank], a
	call GetScriptByte
	ld [wDeferredScriptAddr], a
	call GetScriptByte
	ld [wDeferredScriptAddr + 1], a
	ld hl, wScriptFlags
	set 3, [hl]
	ret

Script_checkscene:
	call CheckScenes
	jr z, .no_scene
	ld [wScriptVar], a
	ret

.no_scene
	ld a, $ff
	ld [wScriptVar], a
	ret

Script_checkmapscene:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	call GetMapSceneID
	ld a, d
	or e
	jr z, .no_scene
	ld a, [de]
	ld [wScriptVar], a
	ret

.no_scene
	ld a, $ff
	ld [wScriptVar], a
	ret

Script_setscene:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	jr DoScene

Script_setmapscene:
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
DoScene:
	call GetMapSceneID
	ld a, d
	or e
	ret z
	call GetScriptByte
	ld [de], a
	ret

Script_readmem:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [hl]
	ld [wScriptVar], a
	ret

Script_writemem:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [wScriptVar]
	ld [hl], a
	ret

Script_loadmem:
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call GetScriptByte
	ld [hl], a
	ret

Script_setval:
	call GetScriptByte
	ld [wScriptVar], a
	ret

Script_addval:
	call GetScriptByte
	ld hl, wScriptVar
	add [hl]
	ld [hl], a
	ret

Script_random:
	call GetScriptByte
	ld [wScriptVar], a
	and a
	ret z

	ld c, a
	call .Divide256byC
	and a
	jr z, .no_restriction ; 256 % b == 0
	ld b, a
	xor a
	sub b
	ld b, a
.loop
	push bc
	call Random
	pop bc
	ldh a, [hRandomAdd]
	cp b
	jr nc, .loop
	jr .finish

.no_restriction
	push bc
	call Random
	pop bc
	ldh a, [hRandomAdd]

.finish
	push af
	ld a, [wScriptVar]
	ld c, a
	pop af
	call SimpleDivide
	ld [wScriptVar], a
	ret

.Divide256byC:
	xor a
	ld b, a
	sub c
.mod_loop
	inc b
	sub c
	jr nc, .mod_loop
	dec b
	add c
	ret

Script_readvar:
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [wScriptVar], a
	ret

Script_writevar:
	call GetScriptByte
	call GetVarAction
	ld a, [wScriptVar]
	ld [de], a
	ret

Script_loadvar:
	call GetScriptByte
	call GetVarAction
	call GetScriptByte
	ld [de], a
	ret

GetVarAction:
	ld c, a
	farcall _GetVarAction
	ret

Script_checkver:
	ld a, [.gs_version]
	ld [wScriptVar], a
	ret

.gs_version:
	db GS_VERSION

Script_getmonname:
	call GetScriptByte
	and a
	jr nz, .gotit
	ld a, [wScriptVar]
.gotit
	ld [wNamedObjectIndex], a
	call GetPokemonName
	ld de, wStringBuffer1

GetStringBuffer:
	call GetScriptByte
	cp NUM_STRING_BUFFERS
	jr c, .ok
	xor a
.ok

CopyConvertedText:
	ld hl, wStringBuffer3
	ld bc, STRING_BUFFER_LENGTH
	call AddNTimes
    jmp CopyName2

Script_getitemname:
	call GetScriptByte
	and a ; USE_SCRIPT_VAR
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wNamedObjectIndex], a
	call GetItemName
	ld de, wStringBuffer1
	jr GetStringBuffer

Script_getcurlandmarkname:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation

ConvertLandmarkToText:
	ld e, a
	farcall GetLandmarkName
	ld de, wStringBuffer1
	jr GetStringBuffer

Script_getlandmarkname:
	call GetScriptByte
	jr ConvertLandmarkToText

Script_gettrainername:
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld b, a
	farcall GetTrainerName
	jr GetStringBuffer

Script_getname:
	call GetScriptByte
	ld [wNamedObjectType], a

ContinueToGetName:
	call GetScriptByte
	ld [wCurSpecies], a
	call GetName
	ld de, wStringBuffer1
	jr GetStringBuffer

Script_gettrainerclassname:
	ld a, TRAINER_NAME
	ld [wNamedObjectType], a
	jr ContinueToGetName

Script_getmoney:
	call ResetStringBuffer1
	call GetMoneyAccount
	ld hl, wStringBuffer1
	lb bc, PRINTNUM_LEFTALIGN | 3, 6
	call PrintNum
	ld de, wStringBuffer1
 	jmp GetStringBuffer

Script_getcoins:
	call ResetStringBuffer1
	ld hl, wStringBuffer1
	ld de, wCoins
	lb bc, PRINTNUM_LEFTALIGN | 2, 6
	call PrintNum
	ld de, wStringBuffer1
 	jmp GetStringBuffer

Script_getnum:
	call ResetStringBuffer1
	ld de, wScriptVar
	ld hl, wStringBuffer1
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
	call PrintNum
	ld de, wStringBuffer1
 	jmp GetStringBuffer

ResetStringBuffer1:
	ld hl, wStringBuffer1
	ld bc, NAME_LENGTH
	ld a, "@"
 	jmp ByteFill

Script_getstring:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld hl, CopyName1
	rst FarCall
	ld de, wStringBuffer2
 	jmp GetStringBuffer

Script_giveitem:
	call GetScriptByte
	cp ITEM_FROM_MEM
	jr nz, .ok
	ld a, [wScriptVar]
.ok
	ld [wCurItem], a
	call GetScriptByte
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .full
	ld a, TRUE
	ld [wScriptVar], a
	ret
.full
	xor a
	ld [wScriptVar], a
	ret

Script_takeitem:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	ld [wItemQuantityChange], a
	ld a, -1
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_checkitem:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_givemoney:
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall GiveMoney
	ret

Script_takemoney:
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall TakeMoney
	ret

Script_checkmoney:
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall CompareMoney

CompareMoneyAction:
	jr c, .less
	jr z, .exact
	ld a, HAVE_MORE
	jr .done
.exact
	ld a, HAVE_AMOUNT
	jr .done
.less
	ld a, HAVE_LESS
.done
	ld [wScriptVar], a
	ret

GetMoneyAccount:
	call GetScriptByte
	and a
	ld de, wMoney ; YOUR_MONEY
	ret z
	ld de, wMomsMoney ; MOMS_MONEY
	ret

LoadMoneyAmountToMem:
	ld bc, hMoneyTemp
	push bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	pop bc
	ret

Script_givecoins:
	call LoadCoinAmountToMem
	farcall GiveCoins
	ret

Script_takecoins:
	call LoadCoinAmountToMem
	farcall TakeCoins
	ret

Script_checkcoins:
	call LoadCoinAmountToMem
	farcall CheckCoins
	jr CompareMoneyAction

LoadCoinAmountToMem:
	call GetScriptByte
	ldh [hMoneyTemp + 1], a
	call GetScriptByte
	ldh [hMoneyTemp], a
	ld bc, hMoneyTemp
	ret

Script_checktime:
	xor a
	ld [wScriptVar], a
	farcall CheckTime
	call GetScriptByte
	and c
	ret z
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_checkpoke:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld hl, wPartySpecies
	ld de, 1
	call IsInArray
	ret nc
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_givepoke:
	call GetScriptByte
	ld [wCurPartySpecies], a
	call GetScriptByte
	ld [wCurPartyLevel], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	and a
	ld b, a
	jr z, .ok
	ld hl, wScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
.ok
	farcall GivePoke
	ld a, b
	ld [wScriptVar], a
	ret

Script_setevent:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
 	jmp EventFlagAction

Script_clearevent:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
 	jmp EventFlagAction

Script_checkevent:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [wScriptVar], a
	ret

Script_setflag:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	jr _EngineFlagAction

Script_clearflag:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
    jr _EngineFlagAction

Script_checkflag:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, CHECK_FLAG
	call _EngineFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [wScriptVar], a
	ret

_EngineFlagAction:
	farcall EngineFlagAction
	ret

Script_wildoff:
	ld hl, wStatusFlags
	set STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	ret

Script_wildon:
	ld hl, wStatusFlags
	res STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	ret

Script_xycompare:
	call GetScriptByte
	ld [wXYComparePointer], a
	call GetScriptByte
	ld [wXYComparePointer + 1], a
	ret

Script_warpfacing:
	call GetScriptByte
	maskbits NUM_DIRECTIONS
	ld c, a
	ld a, [wPlayerSpriteSetupFlags]
	set PLAYERSPRITESETUP_CUSTOM_FACING_F, a
	or c
	ld [wPlayerSpriteSetupFlags], a
; fallthrough

Script_warp:
; This seems to be some sort of error handling case.
	call GetScriptByte
	and a
	jr z, .not_ok
	ld [wMapGroup], a
	call GetScriptByte
	ld [wMapNumber], a
	call GetScriptByte
	ld [wXCoord], a
	call GetScriptByte
	ld [wYCoord], a
	ld a, SPAWN_N_A
	ld [wDefaultSpawnpoint], a
	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
 	jmp StopScript

.not_ok
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, SPAWN_N_A
	ld [wDefaultSpawnpoint], a
	ld a, MAPSETUP_BADWARP
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
 	jmp StopScript

Script_warpmod:
	call GetScriptByte
	ld [wBackupWarpNumber], a
	call GetScriptByte
	ld [wBackupMapGroup], a
	call GetScriptByte
	ld [wBackupMapNumber], a
	ret

Script_blackoutmod:
	call GetScriptByte
	ld [wLastSpawnMapGroup], a
	call GetScriptByte
	ld [wLastSpawnMapNumber], a
	ret

Script_dontrestartmapmusic:
	ld a, TRUE
	ld [wDontPlayMapMusicOnReload], a
	ret

Script_writecmdqueue:
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [wScriptBank]
	ld b, a
    jmp WriteCmdQueue

Script_delcmdqueue:
	xor a
	ld [wScriptVar], a
	call GetScriptByte
	ld b, a
	call DelCmdQueue
	ret c
	ld a, TRUE
	ld [wScriptVar], a
	ret

Script_changemapblocks:
	call GetScriptByte
	ld [wMapBlocksBank], a
	call GetScriptByte
	ld [wMapBlocksPointer], a
	call GetScriptByte
	ld [wMapBlocksPointer + 1], a
	call ChangeMap
 	jmp BufferScreen

Script_changeblock:
	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	call GetBlockLocation
	call GetScriptByte
	ld [hl], a
 	jmp BufferScreen

Script_refreshmap::
	xor a
	ldh [hBGMapMode], a
	call LoadOverworldTilemapAndAttrmapPals
	call GetMovementPermissions
	farcall HDMATransferTilemapAndAttrmap_Overworld
 	jmp UpdateSprites

Script_warpcheck:
	call WarpCheck
	ret nc
	farcall EnableEvents
	ret

Script_newloadmap:
	call GetScriptByte
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_ENTER
	call LoadMapStatus
 	jmp StopScript

Script_reloadend:
	call Script_newloadmap
	jr Script_end

Script_opentext:
 	jmp OpenText

Script_reanchormap:
	call ReanchorMap
 	jmp GetScriptByte

Script_writeunusedbyte:
	call GetScriptByte
	ld [wUnusedScriptByte], a
	ret

Script_closetext:
	call HDMATransferTilemapAndAttrmap_Menu
 	jmp CloseText

Script_autoinput:
	call GetScriptByte
	push af
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	pop af
 	jmp StartAutoInput

Script_pause:
	call GetScriptByte
	and a
	jr z, .loop
	ld [wScriptDelay], a
.loop
	ld c, 4
	call DelayFrames
	ld hl, wScriptDelay
	dec [hl]
	jr nz, .loop
	ret

Script_deactivatefacing:
	call GetScriptByte
	and a
	jr z, .no_time
	ld [wScriptDelay], a
.no_time
	ld a, SCRIPT_WAIT
	ld [wScriptMode], a
    jmp StopScript

Script_stopandsjump:
	call StopScript
 	jmp Script_sjump

Script_end:
	call ExitScriptSubroutine
	ret nc

	xor a
	ld [wScriptRunning], a
	ld a, SCRIPT_OFF
	ld [wScriptMode], a
	ld hl, wScriptFlags
	res 0, [hl]
 	jmp StopScript

Script_endcallback:
	call ExitScriptSubroutine
	ld hl, wScriptFlags
	res 0, [hl]
 	jmp StopScript

ExitScriptSubroutine:
; Return carry if there's no parent to return to.

	ld hl, wScriptStackSize
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld e, [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	and $7f
	ld [wScriptBank], a
	ld a, [hli]
	ld e, a
	ld [wScriptPos], a
	ld a, [hl]
	ld d, a
	ld [wScriptPos + 1], a
	and a
	ret
.done
	scf
	ret

Script_endall:
	xor a
	ld [wScriptStackSize], a
	ld [wScriptRunning], a
	ld a, SCRIPT_OFF
	ld [wScriptMode], a
	ld hl, wScriptFlags
	res 0, [hl]
 	jmp StopScript

Script_halloffame:
	ld hl, wGameTimerPaused
	res GAME_TIMER_COUNTING_F, [hl]
	farcall HallOfFame
	ld hl, wGameTimerPaused
	set GAME_TIMER_COUNTING_F, [hl]
	jr ReturnFromCredits

Script_credits:
	farcall RedCredits
ReturnFromCredits:
	call Script_endall
	ld a, MAPSTATUS_DONE
	call LoadMapStatus
 	jmp StopScript

Script_wait:
	push bc
	call GetScriptByte
.loop
	push af
	ld c, 6
	call DelayFrames
	pop af
	dec a
	jr nz, .loop
	pop bc
	ret

Script_checksave:
	farcall CheckSave
	ld a, c
	ld [wScriptVar], a
	ret
