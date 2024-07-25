ForestAreaH8_MapScripts:
	def_scene_scripts

	def_callbacks

CaveSignTest:
	opentext
	writetext CaveSignText
	waitbutton
	closetext
	end
	
CaveSignText:
	text "This is a test"
	line "to see how many"
	line "characters can "
	cont "fit."

	para "PROF.OAK gave you"
	line "a #DEX?"

	para "<PLAY_G>, is that"
	line "true? Th-that's"
	cont "incredible!"
	done

ForestAreaH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  1, CAVE_H8, 1

	def_coord_events

	def_bg_events
	bg_event  3,  1, BGEVENT_READ, CaveSignTest
	
	def_object_events
