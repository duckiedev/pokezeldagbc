	object_const_def
	const FORESTAREAH8_POKE_BALL1

ForestAreaH8_MapScripts:
	def_scene_scripts

	def_callbacks

ForestAreaH8Ocarina:
		itemball KINSTONE_OCARINA
	
ForestAreaH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  1, CAVE_H8, 1
	warp_event  5,  0, FOREST_ZONE_01, 1
	warp_event  0,  4, FOREST_ZONE_01, 2
	warp_event  9,  4, SIDESCROLLTEST, 1

	def_coord_events

	def_bg_events
	
	def_object_events
