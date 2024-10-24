SECTION "Events", ROMX

OverworldLoop::
	xor a ; MAPSTATUS_START
	ld [wMapStatus], a
.loop
	ld a, [wMapStatus]
	ld hl, .Jumptable
	rst JumpTable
	ld a, [wMapStatus]
	cp MAPSTATUS_DONE
	jr nz, .loop
.done
	ret

.Jumptable:
; entries correspond to MAPSTATUS_* constants
	dw StartMap
	dw EnterMap
	dw HandleMap
	dw .done

DisableEvents:
	xor a
	ld [wEnabledPlayerEvents], a
	ret

EnableEvents::
	ld a, $ff
	ld [wEnabledPlayerEvents], a
	ret

CheckEnabledMapEventsBit5:
	ld hl, wEnabledPlayerEvents
	bit 5, [hl]
	ret

DisableWarpsConnections: ; unreferenced
	ld hl, wEnabledPlayerEvents
	res 2, [hl]
	ret

DisableCoordEvents: ; unreferenced
	ld hl, wEnabledPlayerEvents
	res 1, [hl]
	ret

DisableStepCount: ; unreferenced
	ld hl, wEnabledPlayerEvents
	res 0, [hl]
	ret

DisableWildEncounters: ; unreferenced
	ld hl, wEnabledPlayerEvents
	res 4, [hl]
	ret

EnableWarpsConnections: ; unreferenced
	ld hl, wEnabledPlayerEvents
	set 2, [hl]
	ret

EnableCoordEvents: ; unreferenced
	ld hl, wEnabledPlayerEvents
	set 1, [hl]
	ret

EnableStepCount: ; unreferenced
	ld hl, wEnabledPlayerEvents
	set 0, [hl]
	ret

EnableWildEncounters:
	ld hl, wEnabledPlayerEvents
	set 4, [hl]
	ret

CheckWarpConnectionsEnabled:
	ld hl, wEnabledPlayerEvents
	bit 2, [hl]
	ret

CheckCoordEventsEnabled:
	ld hl, wEnabledPlayerEvents
	bit 1, [hl]
	ret

CheckStepCountEnabled:
	ld hl, wEnabledPlayerEvents
	bit 0, [hl]
	ret

CheckWildEncountersEnabled:
	ld hl, wEnabledPlayerEvents
	bit 4, [hl]
	ret

StartMap:
	xor a
	ld [wScriptVar], a
	xor a
	ld [wScriptRunning], a
	ld hl, wMapStatus
	ld bc, wMapStatusEnd - wMapStatus
	call ByteFill
	farcall InitCallReceiveDelay
	call ClearJoypad
EnterMap:
	xor a
	ld [wXYComparePointer], a
	ld [wXYComparePointer + 1], a
	call SetUpFiveStepWildEncounterCooldown
	farcall RunMapSetupScript
	call DisableEvents

	ldh a, [hMapEntryMethod]
	cp MAPSETUP_CONNECTION
	jr nz, .dont_enable
	call EnableEvents
.dont_enable

	ldh a, [hMapEntryMethod]
	cp MAPSETUP_RELOADMAP
	jr nz, .dontresetpoison
	xor a
	ld [wPoisonStepCount], a
.dontresetpoison

	xor a ; end map entry
	ldh [hMapEntryMethod], a
	ld a, MAPSTATUS_HANDLE
	ld [wMapStatus], a
	ret

HandleMap:
	call HandleMapTimeAndJoypad
	call HandleCmdQueue
	call MapEvents

; Not immediately entering a connected map will cause problems.
	ld a, [wMapStatus]
	cp MAPSTATUS_HANDLE
	ret nz
	call HandleMapObjects
	call NextOverworldFrame
	call HandleMapBackground
	jr CheckPlayerState

MapEvents:
	ld a, [wMapEventStatus]
	and a
	ret nz
	call PlayerEvents
	call DisableEvents
	farcall ScriptEvents
	ret

NextOverworldFrame:
	; If we haven't already performed a delay outside DelayFrame as a result
	; of a busy LY overflow, perform that now.
	ld a, [hDelayFrameLY]
	inc a
 	jmp nz, DelayFrame
	xor a
	ld [hDelayFrameLY], a
	ret

HandleMapTimeAndJoypad:
	ld a, [wMapEventStatus]
	cp MAPEVENTS_OFF
	ret z

	call UpdateTime
	call GetJoypad
 	jmp TimeOfDayPals

HandleMapObjects:
	farcall HandleNPCStep
	farcall _HandlePlayerStep
	jr _CheckObjectEnteringVisibleRange

HandleMapBackground:
	farcall _UpdateSprites
	farcall ScrollScreen
	farcall PlaceMapNameSign
	ret

CheckPlayerState:
	ld a, [wPlayerStepFlags]
	bit PLAYERSTEP_CONTINUE_F, a
	jr z, .events
	bit PLAYERSTEP_STOP_F, a
	jr z, .noevents
	bit PLAYERSTEP_MIDAIR_F, a
	jr nz, .noevents
	call EnableEvents
.events
	ld a, MAPEVENTS_ON
	ld [wMapEventStatus], a
	ret

.noevents
	ld a, MAPEVENTS_OFF
	ld [wMapEventStatus], a
	ret

_CheckObjectEnteringVisibleRange:
	ld hl, wPlayerStepFlags
	bit PLAYERSTEP_STOP_F, [hl]
	ret z
	farcall CheckObjectEnteringVisibleRange
	ret

PlayerEvents:
	xor a
; If there's already a player event, don't interrupt it.
	ld a, [wScriptRunning]
	and a
	ret nz

	call Dummy_CheckEnabledMapEventsBit5 ; This is a waste of time

	call CheckTrainerEvent
	jr c, .ok

	call CheckOWMonEvent
	jr c, .ok

	call CheckTileEvent
	jr c, .ok

	call RunMemScript
	jr c, .ok

	call RunSceneScript
	jr c, .ok

	call CheckTimeEvents
	jr c, .ok

	call OWPlayerInput
	jr c, .ok

	xor a
	ret

.ok
	push af
	farcall EnableScriptMode
	pop af

	ld [wScriptRunning], a
	call DoPlayerEvent
	ld a, [wScriptRunning]
	cp PLAYEREVENT_CONNECTION
	jr z, .ok2
	cp PLAYEREVENT_JOYCHANGEFACING
	jr z, .ok2

	xor a
	ld [wLandmarkSignTimer], a

	; Have player stand (resets running sprite to standing if event starts while running)
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .ok2
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	farcall UpdatePlayerSprite

.ok2
	scf
	ret

CheckTrainerEvent:
	nop
	nop
	call CheckTrainerBattle
	jr nc, .nope

	ld a, PLAYEREVENT_SEENBYTRAINER
	scf
	ret

.nope
	xor a
	ret

CheckOWMonEvent:
	nop
	nop
	farcall CheckOWMonBattle
	jr nc, .nope

	ld a, PLAYEREVENT_SEENBYOWMON
	scf
	ret

.nope
	xor a
	ret

CheckTileEvent:
; Check for warps, coord events, or wild battles.

	call CheckWarpConnectionsEnabled
	jr z, .connections_disabled

	farcall CheckMovingOffEdgeOfMap
	jr c, .map_connection

	call CheckWarpTile
	jr c, .warp_tile

.connections_disabled
	call CheckCoordEventsEnabled
	jr z, .coord_events_disabled

	call CheckCurrentMapCoordEvents
	jr c, .coord_event

.coord_events_disabled
	ld hl, wPlayerStepFlags
	bit PLAYERSTEP_STOP_F, [hl]
	jr z, .no_tile_effects

	; only check if player is running
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .no_tile_effects

	ld a, [wPlayerTileCollision]
	call CheckGrassTile
	jr nz, .no_tile_effects

	call RenderRunThroughGrass
	call SwapGrassCollision

.no_tile_effects
	call CheckStepCountEnabled
	jr z, .step_count_disabled

 	jmp CountStep

.step_count_disabled
	call CheckWildEncountersEnabled
	jr z, .ok

	call RandomEncounter
	ret c

.ok
	xor a
	ret

.map_connection
	ld a, PLAYEREVENT_CONNECTION
	scf
	ret

.warp_tile
	ld a, [wPlayerTileCollision]
	call CheckPitTile
	jr nz, .not_pit
	ld a, PLAYEREVENT_FALL
	scf
	ret

.not_pit
	ld a, PLAYEREVENT_WARP
	scf
	ret

.coord_event
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
    jmp CallScript

CheckWildEncounterCooldown::
	ld hl, wWildEncounterCooldown
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret z
	scf
	ret

SetUpFiveStepWildEncounterCooldown:
	ld a, 5
	ld [wWildEncounterCooldown], a
	ret

SetMinTwoStepWildEncounterCooldown:
; dummied out
	ret
	ld a, [wWildEncounterCooldown]
	cp 2
	ret nc
	ld a, 2
	ld [wWildEncounterCooldown], a
	ret

Dummy_CheckEnabledMapEventsBit5:
 	jmp CheckEnabledMapEventsBit5

RunSceneScript:
	ld a, [wCurMapSceneScriptCount]
	and a
	jr z, .nope

	ld c, a
	call CheckScenes
	cp c
	jr nc, .nope

	ld e, a
	ld d, 0
	ld hl, wCurMapSceneScriptsPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept SCENE_SCRIPT_SIZE
	add hl, de
endr

	call GetMapScriptsBank
	call GetFarWord
	call GetMapScriptsBank
	call CallScript

	ld hl, wScriptFlags
	res 3, [hl]

	farcall EnableScriptMode
	farcall ScriptEvents

	ld hl, wScriptFlags
	bit 3, [hl]
	jr z, .nope

	ld hl, wDeferredScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wDeferredScriptBank]
	call CallScript
	scf
	ret

.nope
	xor a
	ret

CheckTimeEvents:
	farcall CheckDailyResetTimer
	farcall CheckPokerusTick
	ret c

OWPlayerInput:
	call PlayerMovement
	ret c
	and a
	jr nz, .NoAction

; Can't perform button actions while sliding on ice.
	farcall CheckStandingOnIce
	jr c, .NoAction

	call CheckAPressOW
	jr c, .Action

	call CheckMenuOW
	jr c, .Action

.NoAction:
	xor a
	ret

.Action:
	push af
	farcall StopPlayerForEvent
	pop af
	scf
	ret

CheckAPressOW:
	ldh a, [hJoyPressed]
	and A_BUTTON
	ret z
	call TryObjectEvent
	ret c
	call TryBGEvent
	ret c
	call TryTileCollisionEvent
	ret c
	xor a
	ret

PlayTalkObject:
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

TryObjectEvent:
	farcall CheckFacingObject
	jr c, .IsObject
	xor a
	ret

.IsObject:
	call PlayTalkObject
	ldh a, [hObjectStructIndex]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ldh [hLastTalked], a

	ldh a, [hLastTalked]
	call GetMapObject
	ld hl, MAPOBJECT_TYPE
	add hl, bc
	ld a, [hl]

	push bc
	ld de, 3
	ld hl, ObjectEventTypeArray
	call IsInArray
	pop bc
	jr nc, .nope

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nope
	xor a
	ret

ObjectEventTypeArray:
	table_width 3, ObjectEventTypeArray
	dbw OBJECTTYPE_SCRIPT, .script
	dbw OBJECTTYPE_ITEMBALL, .itemball
	dbw OBJECTTYPE_TRAINER, .trainer
	; the remaining four are dummy events
	dbw OBJECTTYPE_OWMON, .owmon
	dbw OBJECTTYPE_TREASURECHEST, .treasurechest
	dbw OBJECTTYPE_5, .five
	dbw OBJECTTYPE_6, .six
	assert_table_length NUM_OBJECT_TYPES
	db -1 ; end

.script
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
 	jmp CallScript

.itemball
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	ld de, wItemBallData
	ld bc, wItemBallDataEnd - wItemBallData
	call FarCopyBytes
	ld a, PLAYEREVENT_ITEMBALL
	scf
	ret

.trainer
	call TalkToTrainer
	ld a, PLAYEREVENT_TALKTOTRAINER
	scf
	ret

.owmon
	call TalkToOWMon
	ld a, PLAYEREVENT_TALKTOOWMON
	scf
	ret

.treasurechest
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	ld de, wTreasureChestData
	ld bc, wTreasureChestDataEnd - wTreasureChestData
	call FarCopyBytes
	ld a, PLAYEREVENT_TREASURECHEST
	scf
	ret

.five
	xor a
	ret

.six
	xor a
	ret

TryBGEvent:
	call CheckFacingBGEvent
	jr c, .is_bg_event
	xor a
	ret

.is_bg_event:
	ld a, [wCurBGEventType]
	ld hl, BGEventJumptable
	rst JumpTable
	ret

BGEventJumptable:
	table_width 2, BGEventJumptable
	dw .read
	dw .up
	dw .down
	dw .right
	dw .left
	dw .ifset
	dw .ifnotset
	dw .itemifset
	dw .copy
	assert_table_length NUM_BGEVENTS

.up:
	ld b, OW_UP
	jr .checkdir

.down:
	ld b, OW_DOWN
	jr .checkdir

.right:
	ld b, OW_RIGHT
	jr .checkdir

.left:
	ld b, OW_LEFT
	jr .checkdir

.checkdir:
	ld a, [wPlayerDirection]
	and %1100
	cp b
	jr nz, .dontread
.read:
	call PlayTalkObject
	ld hl, wCurBGEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.itemifset:
	call CheckBGEventFlag
	jr nz, .dontread
	call PlayTalkObject
	call GetMapScriptsBank
	ld de, wHiddenItemData
	ld bc, wHiddenItemDataEnd - wHiddenItemData
	call FarCopyBytes
	ld a, BANK(HiddenItemScript)
	ld hl, HiddenItemScript
	call CallScript
	scf
	ret

.copy:
	call CheckBGEventFlag
	jr nz, .dontread
	call GetMapScriptsBank
	ld de, wHiddenItemData
	ld bc, wHiddenItemDataEnd - wHiddenItemData
	call FarCopyBytes
	jr .dontread

.ifset:
	call CheckBGEventFlag
	jr z, .dontread
	jr .thenread

.ifnotset:
	call CheckBGEventFlag
	jr nz, .dontread
.thenread:
	push hl
	call PlayTalkObject
	pop hl
	inc hl
	inc hl
	call GetMapScriptsBank
	call GetFarWord
	call GetMapScriptsBank
	call CallScript
	scf
	ret

.dontread:
	xor a
	ret

CheckBGEventFlag:
	ld hl, wCurBGEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call GetMapScriptsBank
	call GetFarWord
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	ret

PlayerMovement:
	farcall DoPlayerMovement
	ld a, c
	ld hl, PlayerMovementPointers
	rst JumpTable
	ld a, c
	ret

PlayerMovementPointers:
; entries correspond to PLAYERMOVEMENT_* constants
	table_width 2, PlayerMovementPointers
	dw .normal
	dw .warp
	dw .turn
	dw .force_turn
	dw .finish
	dw .continue
	dw .exit_water
	dw .jump
	assert_table_length NUM_PLAYER_MOVEMENTS

.normal:
.finish:
.jump:
	xor a
	ld c, a
	ret

.warp:
	ld a, PLAYEREVENT_WARP
	ld c, a
	scf
	ret

.turn:
	ld a, PLAYEREVENT_JOYCHANGEFACING
	ld c, a
	scf
	ret

.force_turn:
; force the player to move in some direction
	ld a, BANK(Script_ForcedMovement)
	ld hl, Script_ForcedMovement
	call CallScript
	ld c, a
	scf
	ret

.continue:
.exit_water:
	ld a, -1
	ld c, a
	and a
	ret

CheckMenuOW:
	xor a
	ldh [hMenuReturn], a
	ldh [hUnusedByte], a
	ldh a, [hJoyPressed]

	bit SELECT_F, a
	jr nz, .Select

	bit START_F, a
	jr z, .NoMenu

	ld a, BANK(StartMenuScript)
	ld hl, StartMenuScript
	call CallScript
	scf
	ret

.NoMenu:
	xor a
	ret

.Select:
	call PlayTalkObject
	ld a, BANK(SelectMenuScript)
	ld hl, SelectMenuScript
	call CallScript
	scf
	ret

StartMenuScript:
	callasm StartMenu
	sjump StartMenuCallback

SelectMenuScript:
	callasm SelectMenu
	sjump SelectMenuCallback

StartMenuCallback:
SelectMenuCallback:
	readmem hMenuReturn
	ifequal HMENURETURN_SCRIPT, .Script
	ifequal HMENURETURN_ASM, .Asm
	end

.Script:
	memjump wQueuedScriptBank

.Asm:
	memcallasm wQueuedScriptBank
	end

CountStep:
	; If Repel wore off, don't count the step.
	call DoRepelStep
	jr c, .doscript

	; Count the step for poison and total steps
	ld hl, wPoisonStepCount
	inc [hl]
	ld hl, wStepCount
	inc [hl]
	; Every 256 steps, increase the happiness of all your Pokemon.

	; Every 256 steps, offset from the happiness incrementor by 128 steps.
	ld a, [wStepCount]
	cp $80

	; Every 4 steps, deal damage to all poisoned Pokemon.
	ld hl, wPoisonStepCount
	ld a, [hl]
	cp 4
	jr c, .skip_poison
	ld [hl], 0

	farcall DoPoisonStep
	jr c, .doscript

.skip_poison
	farcall DoBikeStep

.done
	xor a
	ret

.doscript
	ld a, -1
	scf
	ret

DoRepelStep:
	ld a, [wRepelEffect]
	and a
	ret z

	dec a
	ld [wRepelEffect], a
	ret nz

	ld a, BANK(RepelWoreOffScript)
	ld hl, RepelWoreOffScript
	call CallScript
	scf
	ret

DoPlayerEvent:
	ld a, [wScriptRunning]
	and a
	ret z

	cp PLAYEREVENT_MAPSCRIPT ; run script
	ret z

	cp NUM_PLAYER_EVENTS
	ret nc

	ld c, a
	ld b, 0
	ld hl, PlayerEventScriptPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wScriptBank], a
	ld a, [hli]
	ld [wScriptPos], a
	ld a, [hl]
	ld [wScriptPos + 1], a
	ret

PlayerEventScriptPointers:
; entries correspond to PLAYEREVENT_* constants
	table_width 3, PlayerEventScriptPointers
	dba InvalidEventScript      ; PLAYEREVENT_NONE
	dba SeenByTrainerScript     ; PLAYEREVENT_SEENBYTRAINER
	dba TalkToTrainerScript     ; PLAYEREVENT_TALKTOTRAINER
	dba FindItemInBallScript    ; PLAYEREVENT_ITEMBALL
	dba EdgeWarpScript          ; PLAYEREVENT_CONNECTION
	dba WarpToNewMapScript      ; PLAYEREVENT_WARP
	dba FallIntoMapScript       ; PLAYEREVENT_FALL
	dba OverworldWhiteoutScript ; PLAYEREVENT_WHITEOUT
	dba ChangeDirectionScript   ; PLAYEREVENT_JOYCHANGEFACING
	dba SeenByOWMonScript       ; PLAYEREVENT_SEENBYOWMON
	dba TalkToOWMonScript       ; PLAYEREVENT_TALKTOOWMON
	dba TreasureChestScript		; PLAYEREVENT_TREASURECHEST
	dba InvalidEventScript      ; (NUM_PLAYER_EVENTS)
	assert_table_length NUM_PLAYER_EVENTS + 1

InvalidEventScript:
	end

WarpToNewMapScript:
	warpsound
	newloadmap MAPSETUP_DOOR
	end

FallIntoMapScript:
	newloadmap MAPSETUP_FALL
	playsound SFX_KINESIS
	applymovement PLAYER, .SkyfallMovement
	playsound SFX_STRENGTH
	scall LandAfterPitfallScript
	end

.SkyfallMovement:
	skyfall
	step_wait_end

LandAfterPitfallScript:
	earthquake 16
	end

EdgeWarpScript:
	reloadend MAPSETUP_CONNECTION

ChangeDirectionScript:
	callasm UnfreezeAllObjects
	callasm EnableWildEncounters
	end

RenderRunThroughGrass:
	call GetBGMapPlayerOffset

	push hl
	; assume tiles are standard grass: tile $0A, BGP2, bank 0;
	; write cut grass with same palette and bank

; horizontal
	ld bc, BG_MAP_WIDTH
	add hl, bc
	ld a, $0a
	call QueueVolatileTiles
	inc hl
	ld a, $0a
	call QueueVolatileTiles

	pop hl
.vertical

	ld a, $0a
	call QueueVolatileTiles
	inc hl
	ld a, $0a
	call QueueVolatileTiles
	ld bc, BG_MAP_WIDTH - 1
	add hl, bc
	ld a, $0a
	call QueueVolatileTiles
 	jmp FinishVolatileTiles

SwapGrassCollision:
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
	ld a, COLL_FLOOR
	ld [wSetTileCollisionType], a
 	jmp SetCoordTileCollision

INCLUDE "engine/overworld/scripting.asm"

WarpToSpawnPoint::
	ld hl, wStatusFlags2
	res STATUSFLAGS2_SAFARI_GAME_F, [hl]
	ret

RunMemScript::
; If there is no script here, we don't need to be here.
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret z
; Execute the script at (wMapReentryScriptBank):(wMapReentryScriptAddress).
	ld hl, wMapReentryScriptAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapReentryScriptBank]
	call CallScript
	scf
; Clear the buffer for the next script.
	push af
	xor a
	ld hl, wMapReentryScriptQueueFlag
	ld bc, 8
	call ByteFill
	pop af
	ret

LoadMemScript::
; If there's already a script here, don't overwrite.
	ld hl, wMapReentryScriptQueueFlag
	ld a, [hl]
	and a
	ret nz
; Set the flag
	ld [hl], 1
	inc hl
; Load the script pointer b:de into (wMapReentryScriptBank):(wMapReentryScriptAddress)
	ld [hl], b
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	scf
	ret

TryTileCollisionEvent::
	call GetFacingTileCoord
	ld [wFacingTileID], a
	ld c, a
	; CheckFacingTileForStdScript preserves c, and
	; farcall copies c back into a.
	farcall CheckFacingTileForStdScript
	jr c, .done

	; CheckCutTreeTile expects a == [wFacingTileID], which
	; it still is after the previous farcall.
	call CheckCutTreeTile
	jr nz, .whirlpool
	farcall TryCutOW
	jr .done

.whirlpool
	ld a, [wFacingTileID]
	call CheckWhirlpoolTile
	jr nz, .waterfall
	farcall TryWhirlpoolOW
	jr .done

.waterfall
	ld a, [wFacingTileID]
	call CheckWaterfallTile
	jr nz, .headbutt
	farcall TryWaterfallOW
	jr .done

.headbutt
	ld a, [wFacingTileID]
	call CheckHeadbuttTreeTile
	jr nz, .vine_whip
	farcall TryHeadbuttOW
	jr c, .done
	jr .noevent

.vine_whip
	ld a, [wFacingTileID]
	call CheckVineWhipTile
	jr nz, .surf
	farcall TryVineWhipOW
	jr .done

.surf
	farcall TrySurfOW
	jr nc, .noevent
	jr .done

.noevent
	xor a
	ret

.done
	call PlayClickSFX
	ld a, PLAYEREVENT_MAPSCRIPT
	scf
	ret

RandomEncounter::
	call CheckWildEncounterCooldown
	jr c, .nope
	call CanEncounterWildMon
	jr nc, .nope
	farcall TryWildEncounter
	jr nz, .nope
	jr .ok

.nope
	ld a, 1
	and a
	ret

.ok
	push bc
	ld bc, wPlayerStruct
	farcall ResetObject
	pop bc
	ld a, BANK(WildBattleScript)
	ld hl, WildBattleScript
	jr .done

.done
	call CallScript
	scf
	ret

WildBattleScript:
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

CanEncounterWildMon::
	ld hl, wStatusFlags
	bit STATUSFLAGS_NO_WILD_ENCOUNTERS_F, [hl]
	jr nz, .no
	ld a, [wEnvironment]
	cp CAVE
	jr z, .ice_check
	cp DUNGEON
	jr z, .ice_check
	farcall CheckGrassCollision
	jr nc, .no

.ice_check
	ld a, [wPlayerTileCollision]
	call CheckIceTile
	jr z, .no
	scf
	ret

.no
	and a
	ret

DoBikeStep::
	nop
	nop

	; If we're not on the bike, we don't have to be here.
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	jr nz, .End

	; Check the bike step count and check whether we've
	; taken 65536 of them yet.
	ld hl, wBikeStep
	ld a, [hli]
	ld d, a
	ld e, [hl]

.increment
	inc de
	ld [hl], e
	dec hl
	ld [hl], d

.End:
	xor a
	ret

INCLUDE "engine/overworld/cmd_queue.asm"
