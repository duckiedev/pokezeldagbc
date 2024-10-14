	object_const_def
	const FORESTAREA1_POKE_BALL1

ForestArea1_MapScripts:
	def_scene_scripts

	def_callbacks

ForestArea1Ocarina:
		itemball KINSTONE_OCARINA
	
ForestArea1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  1, CAVE_1, 1
	warp_event  5,  0, FOREST_GATE_01, 1
	warp_event  0,  4, FOREST_ZONE_01, 2
	warp_event  9,  4, FOREST_ZONE_01, 3

	def_coord_events

	def_bg_events
	
	def_object_events
	object_event  6, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, ForestArea1Ocarina, EVENT_ROUTE_45_NUGGET