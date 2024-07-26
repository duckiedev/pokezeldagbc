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
	text "ELM: What?!?"

	para "PROF.OAK gave you"
	line "a #DEX?"

	para "<PLAY_G>, is that"
	line "true? Th-that's"
	cont "incredible!"

	para "He is superb at"
	line "seeing the poten-"
	cont "tial of people as"
	cont "trainers."

	para "Wow, <PLAY_G>. You"
	line "may have what it"

	para "takes to become"
	line "the CHAMPION."

	para "You seem to be"
	line "getting on great"
	cont "with #MON too."

	para "You should take"
	line "the #MON GYM"
	cont "challenge."

	para "The closest GYM"
	line "would be the one"
	cont "in VIOLET CITY."
	done

ForestAreaH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  1, CAVE_H8, 1

	def_coord_events

	def_bg_events
	bg_event  3,  1, BGEVENT_READ, CaveSignTest
	
	def_object_events
