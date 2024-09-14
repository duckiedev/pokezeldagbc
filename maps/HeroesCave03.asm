	object_const_def
	const HEROES_CAVE_03_ROAMINGMON_ZOL_01
	const HEROES_CAVE_03_ROAMINGMON_ZOL_02
	const HEROES_CAVE_03_ROAMINGMON_ZOL_03

HeroesCave03_MapScripts:
	def_scene_scripts

	def_callbacks

HeroesCave03RoamingMonZol01:
	owmon ZOL, 5, EVENT_BEAT_ZOL_01_HEROES_CAVE_03, .AfterScript

.AfterScript
	disappear HEROES_CAVE_03_ROAMINGMON_ZOL_01
	end

HeroesCave03RoamingMonZol02:
	owmon ZOL, 5, EVENT_BEAT_ZOL_02_HEROES_CAVE_03, .AfterScript

.AfterScript
	disappear HEROES_CAVE_03_ROAMINGMON_ZOL_02
	end

HeroesCave03RoamingMonZol03:
	owmon ZOL, 5, EVENT_BEAT_ZOL_03_HEROES_CAVE_03, .AfterScript

.AfterScript
	disappear HEROES_CAVE_03_ROAMINGMON_ZOL_03
	end

HeroesCave03CheckBush:
	conditional_event EVENT_CAVEH8_HIDDEN_DOOR_REVEALED, .Script
.Script
	opentext
	checkevent EVENT_GOT_HONEDGE
	iftrue .AskToCut
	farwritetext _CanCutText
	closetext
	end

.AskToCut
	farwritetext _AskCutText
	yesorno
	iffalse .skip
	closetext
	callasm OWCutAnimation
	changeblock $a, $4, $5B
	refreshmap
	reanchormap
.skip
	end


HeroesCave03_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  9, HEROES_CAVE_02, 2

	def_coord_events

	def_bg_events
	bg_event 11,  4, BGEVENT_IFNOTSET, HeroesCave03CheckBush
	
	def_object_events
	object_event 11,  2, SPRITE_ZOL, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_OWMON, 3, HeroesCave03RoamingMonZol01, -1
	object_event 12,  8, SPRITE_ZOL, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_OWMON, 3, HeroesCave03RoamingMonZol02, -1
	object_event  1,  6, SPRITE_ZOL, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_OWMON, 2, HeroesCave03RoamingMonZol03, -1
