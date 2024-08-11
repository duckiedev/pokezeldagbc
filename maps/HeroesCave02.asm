	object_const_def
	const HEROES_CAVE_02_ROAMINGMON_ZUBAT

HeroesCave02_MapScripts:
	def_scene_scripts

	def_callbacks

RoamingMonZubat01:
	owmon ZUBAT, 5, EVENT_BEAT_ZUBAT_HEROES_CAVE_02, .Script

.Script
	changeblock $6, $1, $36
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	waitsfx
	refreshmap
	changeblock $0, $5, $3E
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	waitsfx
	refreshmap
	changeblock $6, $9, $3C
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	waitsfx
	refreshmap
	playsound SFX_SOLVE_PUZZLE
	waitsfx
	end

TrainerFisherKyle1:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyle1SeenText, FisherKyle1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

FisherKyle1SeenText:
	text "Do you remember?"
	done

FisherKyle1BeatenText:
	text "You do remember?"
	done

FisherKyle1AfterBattleText:
	text "The tug you feel"
	line "on the ROD when"

	para "you hook a #-"
	line "MON…"

	para "That's the best"
	line "feeling ever for"
	cont "an angler like me."
	done


HeroesCave02_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, HEROES_CAVE_01, 2
	warp_event  6,  0, HEROES_CAVE_01, 1
	warp_event  6,  9, HEROES_CAVE_01, 1

	def_coord_events

	def_bg_events
	
	def_object_events
	object_event  5,  5, SPRITE_ZUBAT, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_OWMON, 3, RoamingMonZubat01, -1
	object_event  2,  2, SPRITE_OLDMAN, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFisherKyle1, -1
