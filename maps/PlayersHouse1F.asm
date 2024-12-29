	object_const_def
	const PLAYERSHOUSE1F_MOM1
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	def_scene_scripts
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_MEET_MOM
	scene_script PlayersHouse1FNoop1Scene, SCENE_PLAYERSHOUSE1F_VCR_CLOCK
	scene_script PlayersHouse1FNoop2Scene, SCENE_PLAYERSHOUSE1F_NOOP

	def_callbacks

PlayersHouse1FNoop1Scene:
	end

PlayersHouse1FNoop2Scene:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_MOM1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksToPlayerMovement
MeetMomScript:
	opentext
	setscene SCENE_PLAYERSHOUSE1F_NOOP
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext ElmsLookingForYouText
	promptbutton
	closetext
	end

.FromRight:
	applymovement PLAYERSHOUSE1F_MOM1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_MOM1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_MOM1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

PlayersHouse1FReceiveItemStd:
	jumpstd ReceiveItemScript
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene
	iffalse MeetMomTalkedScript ; SCENE_PLAYERSHOUSE1F_MEET_MOM
	opentext
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

MeetMomVCRScript:
	checkevent EVENT_SET_VCR
NeighborScript:
	faceplayer
	opentext
	writetext NeighborText
	waitbutton
	closetext
	end

PlayersHouse1FTVScript:
	checkevent EVENT_SET_VCR
	iffalse .not_set
	opentext
	writetext VCRAlreadySetText
	yesorno
	iftrue .not_set
	closetext
	end

.not_set:
	reanchormap
	callasm DisableStuff
	special _InitClock
	special SetDayOfWeek
	special InitialClearDSTFlag
	special _InitializeStartDay
	setevent EVENT_SET_VCR
	callasm ReloadMap
	refreshmap
	end

DisableStuff:
	xor a
	ldh [hBGMapMode], a
	farcall FadeOutPalettes
	call ClearSprites
    jmp DisableSpriteUpdates

ReloadMap:
	farcall ClearSavedObjPals
	farcall DisableDynPalUpdates
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call UpdateSprites
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	farcall LoadOW_BGPal7
	call WaitBGMap2
	farcall FadeInPalettes_EnableDynNoApply
	jmp EnableSpriteUpdates

PlayersHouse1FStoveScript:
	jumptext PlayersHouse1FStoveText

PlayersHouse1FSinkScript:
	jumptext PlayersHouse1FSinkText

PlayersHouse1FFridgeScript:
	jumptext PlayersHouse1FFridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

VCRAlreadySetText:
	text "The VCR is set."

	para "Do you want to"
	line "reset it?"
	done

ElmsLookingForYouText:
	text "Oh, <PLAYER>…!"
	line "Did you check your"
	cont "email?"
	
	para "How exciting!"
	line "I'm so proud of"
	cont "you!"

	para "PROF.ELM said to"
	line "come over when you"
	cont "finish registering"
	cont "online."

	para "But first…"
	
	para "Can you fix the"
	line "time on the VCR"
	cont "for me?"

	para "Last night's storm"
	line "must have knocked"
	cont "the power out…"

	para "…and you know how"
	line "machines and I get"
	cont "along…"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

HurryUpElmIsWaitingText:
	text "PROF.ELM is wait-"
	line "ing for you."

	para "Hurry up, baby!"
	done

NeighborText:
	text "Congrats <PLAY_G>!"
	done

PlayersHouse1FStoveText:
	text "Mom's specialty!"

	para "CINNABAR VOLCANO"
	line "BURGER!"
	done

PlayersHouse1FSinkText:
	text "The sink is spot-"
	line "less. Mom likes it"
	cont "clean."
	done

PlayersHouse1FFridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "FRESH WATER and"
	line "tasty LEMONADE!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, NEW_BARK_TOWN, 2
	warp_event  7,  7, NEW_BARK_TOWN, 2
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	def_coord_events
	coord_event  8,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomLeftScript
	coord_event  9,  4, SCENE_PLAYERSHOUSE1F_MEET_MOM, MeetMomRightScript
	coord_event  6,  7, SCENE_PLAYERSHOUSE1F_VCR_CLOCK, MeetMomVCRScript
	coord_event  7,  7, SCENE_PLAYERSHOUSE1F_VCR_CLOCK, MeetMomVCRScript

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, PlayersHouse1FStoveScript
	bg_event  1,  1, BGEVENT_READ, PlayersHouse1FSinkScript
	bg_event  2,  1, BGEVENT_READ, PlayersHouse1FFridgeScript
	bg_event  4,  1, BGEVENT_READ, PlayersHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
