	object_const_def

PowerPlant_MapScripts:
	def_scene_scripts
	scene_script PowerPlantNoop1Scene, SCENE_POWERPLANT_NOOP

	def_callbacks

PowerPlantNoop1Scene:
	end

PowerPlant_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	def_coord_events

	def_bg_events

	def_object_events
