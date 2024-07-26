	object_const_def
	const CAVEH8_OLDMAN
	const CAVEH8_HONEDGE

CaveH8_MapScripts:
	def_scene_scripts
	scene_script CaveH8_ItsDangerousToGoAloneScene, SCENE_CAVE_H8_OLDMAN_DANGEROUS_TO_GO_ALONE
	;scene_script CaveH8Noop2Scene, SCENE_CAVE_H8_NOOP

	def_callbacks

CaveH8_ItsDangerousToGoAloneScene:
	applymovement PLAYER, CaveH8_WalkUpToOldManMovement
	turnobject CAVEH8_OLDMAN, DOWN
	showemote EMOTE_SHOCK, CAVEH8_OLDMAN, 15
	;checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	;LookAtElmPokeBallScript
	;turnobject ELMSLAB_ELM, DOWN
	reanchormap
	writetext OldManText_ItsDangerous
	waitbutton
	closetext
	pokepic HONEDGE_H
	cry HONEDGE_H
	waitbutton
	closepokepic
	disappear CAVEH8_HONEDGE
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	promptbutton
	waitsfx
	getmonname STRING_BUFFER_3, HONEDGE_H
	;writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke HONEDGE_H, 5, BERRY
	closetext
	end

OldManText_ItsDangerous:
	text "It's dangerous"
	line "to go alone."
	
	para "Take this!"
	done

CaveH8_WalkUpToOldManMovement:
	step UP
	step UP
	step UP
	step_end

CaveH8_HonedgeScript:
	pokepic HONEDGE_H
	cry HONEDGE_H
	waitbutton
	closepokepic
	end

CaveH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  8, FOREST_AREA_H8, 1
	warp_event  9,  2, PLAYERS_HOUSE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_OLDMAN, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, -1, -1
	object_event  6,  3, SPRITE_HONEDGE_H, SPRITEMOVEDATA_STILL, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CaveH8_HonedgeScript, -1
