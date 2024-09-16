	object_const_def
	const ROUTE31_YOUNGSTER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2

Route31_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, Route31CheckMomCallCallback

Route31CheckMomCallCallback:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	endcallback

.DoMomCall:
	endcallback

Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

DarkCaveSign:
	jumptext DarkCaveSignText

Route31CooltrainerMScript:
	jumptextfaceplayer Route31CooltrainerMText

Route31FruitTree:
	fruittree FRUITTREE_ROUTE_31

Route31Potion:
	itemball POTION

Route31PokeBall:
	itemball POKE_BALL

Route31CooltrainerMText:
	text "DARK CAVE…"

	para "If #MON could"
	line "light it up, I'd"
	cont "explore it."
	done

Text_Route31SleepyMan:
	text "… Hnuurg… Huh?"

	para "I walked too far"
	line "today looking for"
	cont "#MON."

	para "My feet hurt and"
	line "I'm sleepy…"

	para "If I were a wild"
	line "#MON, I'd be"
	cont "easy to catch…"

	para "…Zzzz…"
	done

Text_Route31DescribeNightmare:
	text "TM50 is NIGHTMARE."

	para "It's a wicked move"
	line "that steadily cuts"

	para "the HP of a sleep-"
	line "ing enemy."

	para "Ooooh…"
	line "That's scary…"

	para "I don't want to"
	line "have bad dreams."
	done

Text_Route31CantTakeLastMon:
	text "If I take that"
	line "#MON from you,"

	para "what are you going"
	line "to use in battle?"
	done

Route31YoungsterText:
	text "I found a good"
	line "#MON in DARK"
	cont "CAVE."

	para "I'm going to raise"
	line "it to take on"
	cont "FALKNER."

	para "He's the leader of"
	line "VIOLET CITY's GYM."
	done

Route31SignText:
	text "ROUTE 31"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done

DarkCaveSignText:
	text "DARK CAVE"
	done

Route31_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  6, ROUTE_31_VIOLET_GATE, 3
	warp_event  4,  7, ROUTE_31_VIOLET_GATE, 4
	warp_event 34,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	def_coord_events

	def_bg_events
	bg_event  7,  5, BGEVENT_READ, Route31Sign
	bg_event 31,  5, BGEVENT_READ, DarkCaveSign

	def_object_events
	object_event  9,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	object_event 33,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31CooltrainerMScript, -1
	object_event 16,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31FruitTree, -1
	object_event 29,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	object_event 19, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL
