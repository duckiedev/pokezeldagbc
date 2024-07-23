	object_const_def
	const CAVE_H8_OLDMAN
	const CAVE_H8_HONEDGE

CaveH8_MapScripts:
	def_scene_scripts
	;scene_script CaveH8_ItsDangerousToGoAloneScene, SCENE_CAVE_H8_OLDMAN_DANGEROUS_TO_GO_ALONE
	;scene_script CaveH8Noop2Scene, SCENE_CAVE_H8_NOOP

	def_callbacks

CaveH8TeacherScript:
CaveH8FisherScript:
	end

CaveH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  8, FOREST_AREA_H8, 1
	warp_event  9,  2, PLAYERS_HOUSE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CaveH8TeacherScript, -1
	object_event  6,  3, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CaveH8FisherScript, -1
