	object_const_def
	const HEROES_CAVE_01_FAIRY

HeroesCave01_MapScripts:
	def_scene_scripts
	;scene_script HeroesCave01_FairyFountainHeal, SCENE_HEROES_CAVE_01_FAIRY_FOUNTAIN_HEAL
	;scene_script HeroesCave01NoopScene, SCENE_HEROES_CAVE_01_NOOP

	def_callbacks

;HeroesCave01_FairyFountainHeal:
;	sdefer HeroesCave01_ItsDangerousToGoAloneIntroScene
;	end

;HeroesCave01NoopScene:
;	end

;HeroesCave01_ItsDangerousToGoAloneIntroScene:
;	applymovement PLAYER, HeroesCave01_WalkUpToOldManMovement
;	showemote EMOTE_SHOCK, HeroesCave01_OLDMAN, 15
;	reanchormap
;	setevent EVENT_HEROES_CAVE_01_OLDMAN_INTRO
;	setscene SCENE_HEROES_CAVE_01_NOOP
;	sjump HeroesCave01_ItsDangerousSpeechBox
;	end

HeroesCave01_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, CAVE_H8, 2
	warp_event 13,  5, HEROES_CAVE_01, 1

	def_coord_events

	def_bg_events
	
	def_object_events
	object_event  6,  2, SPRITE_CAPTAIN_TOAD, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, -1, -1
