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

HeroesCave02_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, HEROES_CAVE_01, 2
	warp_event  6,  0, HEROES_CAVE_01, 1

	def_coord_events

	def_bg_events
	
	def_object_events
	object_event  5,  5, SPRITE_ZUBAT, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_OWMON, 3, RoamingMonZubat01, -1
