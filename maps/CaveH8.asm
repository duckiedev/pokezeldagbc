	object_const_def
	const CAVEH8_OLDMAN
	const CAVEH8_HONEDGE
	const CAVEH8_CUTBUSH

CaveH8_MapScripts:
	def_scene_scripts
	scene_script CaveH8_IntroScene, SCENE_CAVEH8_INTRO
	scene_script CaveH8_ItsDangerousToGoAloneIntroScene, SCENE_CAVEH8_OLDMAN_DANGEROUS_TO_GO_ALONE_INTRO
	scene_script CaveH8NoopScene, SCENE_CAVEH8_NOOP

	def_callbacks

CaveH8_IntroScene:
	sdefer CaveH8_ItsDangerousToGoAloneIntroScene
	end

CaveH8NoopScene:
	end

CaveH8_ItsDangerousToGoAloneIntroScene:
	applymovement PLAYER, CaveH8_WalkUpToOldManMovement
	showemote EMOTE_SHOCK, CAVEH8_OLDMAN, 15
	reanchormap
	setevent EVENT_CAVEH8_OLDMAN_INTRO
	setscene SCENE_CAVEH8_NOOP
	sjump CaveH8_ItsDangerousSpeechBox
	end

CaveH8_ItsDangerousSpeechBox:
	opentext
	writetext OldManText_ItsDangerous
	promptbutton
	closetext
	end
	
CaveH8_HonedgeScript:
	reanchormap
	pokepic HONEDGE_H
	cry HONEDGE_H
	waitbutton
	closepokepic
	setevent EVENT_GOT_HONEDGE
	getmonname STRING_BUFFER_3, HONEDGE_H
	opentext
	writetext ReceivedHonedgeText
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	closetext
	disappear CAVEH8_HONEDGE
	disappear CAVEH8_OLDMAN
	opentext
	givepoke HONEDGE_H, 5, BERRY
	closetext
	end

CheckBush:
	conditional_event EVENT_CAVEH8_HIDDEN_DOOR_REVEALED, .Script
.Script
	checkevent EVENT_GOT_HONEDGE
	opentext
	iftrue .AskToCut
	farwritetext _CanCutText
	closetext
	end

.AskToCut
	farwritetext _AskCutText
	yesorno
	iffalse .skip
	closetext
	callasm OWCutAnimation
	changeblock $8, $3, $15
	refreshmap
	reanchormap

.skip
	end

OldManText_ItsDangerous:
	text "It's dangerous to"
	line "go alone!"
	
	para "Take this."
	done

ReceivedHonedgeText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

CaveH8_WalkUpToOldManMovement:
	step UP
	step UP
	step_end

CaveH8_TurnToPokemon:
	turn_step RIGHT
	step_end

CaveH8_WalkDownToPlayer:
	turn_step DOWN
	slow_step DOWN
	step_end

CaveH8_TeleportOut:
	teleport_to
	step_end

CaveH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  8, FOREST_AREA_H8, 1
	warp_event  9,  2, PLAYERS_HOUSE_1F, 1

	def_coord_events

	def_bg_events
	bg_event  9,  2, BGEVENT_IFNOTSET, CheckBush
	
	def_object_events
	object_event  5,  3, SPRITE_OLDMAN, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CaveH8_ItsDangerousSpeechBox, -1
	object_event  5,  4, SPRITE_HONEDGE_H, SPRITEMOVEDATA_STILL, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CaveH8_HonedgeScript, -1
