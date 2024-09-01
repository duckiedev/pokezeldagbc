	object_const_def

Route36NationalParkGate_MapScripts:
	def_scene_scripts

	def_callbacks


Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	def_coord_events

	def_bg_events

	def_object_events
