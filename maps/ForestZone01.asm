ForestZone01_MapScripts:
	def_scene_scripts

	def_callbacks

ForestZone01_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 21,  9, FOREST_AREA_H8, 1
	warp_event 15, 14, FOREST_AREA_H8, 2
	warp_event 26, 14, FOREST_AREA_H8, 3
	warp_event 37, 14, CAVE_H8, 100
	warp_event 21,  2, CAVE_H8, 100
	warp_event 37,  6, CAVE_H8, 100
	warp_event 33,  0, CAVE_H8, 100
	warp_event 29, 14, CAVE_H8, 100
	warp_event 37,  5, CAVE_H8, 100
	warp_event 28,  0, CAVE_H8, 100
	warp_event 10, 11, CAVE_H8, 100
	warp_event 27,  6, CAVE_H8, 100
	warp_event  1,  0, CAVE_H8, 100
	warp_event 10,  2, CAVE_H8, 100
	warp_event  0,  5, CAVE_H8, 100

	def_coord_events

	def_bg_events
	
	def_object_events
