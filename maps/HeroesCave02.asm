	object_const_def
	const HEROESCAVE02_ROAMINGMON_ITTIBAT
	const HEROESCAVE02_TREASURECHEST

HeroesCave02_MapScripts:
	def_scene_scripts
	scene_script HeroesCave02_EnterThenLockScene, SCENE_HEROESCAVE02_ENTERTHENLOCK
	scene_script HeroesCave02_LockDoorsScene, SCENE_HEROESCAVE02_LOCK_DOORS
	scene_script HeroesCave02NoopScene1, SCENE_HEROESCAVE02_NOOP
	def_callbacks

HeroesCave02_EnterThenLockScene:
	sdefer HeroesCave02_LockDoorsScene
	end

HeroesCave02NoopScene1:
	end

HeroesCave02_LockDoorsScene:
	playmusic MUSIC_NONE
	;reanchormap
	applymovement PLAYER, HeroesCave02_PlayerDoorStepMovement
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $6, $1, $35
	changeblock $0, $5, $3D
	changeblock $6, $9, $3B
	waitsfx
	reanchormap
	special RestartMapMusic
	;setevent EVENT_HEROESCAVE02
	setscene SCENE_HEROESCAVE02_NOOP
	end

HeroesCave02_PlayerDoorStepMovement:
	step RIGHT
	step_end

HeroesCave02RoamingMonIttibat01:
	owmon ITTIBAT, 5, EVENT_BEAT_ITTIBAT_HEROES_CAVE_02, .Script

.Script
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $6, $1, $36
	waitsfx
	refreshmap
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $0, $5, $3E
	waitsfx
	refreshmap
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $6, $9, $3C
	waitsfx
	refreshmap
	playsound SFX_SOLVE_PUZZLE
	waitsfx
	end

HeroesCave02TreasureChest:
	treasurechest BIG_RUPEE, EVENT_TREASURECHEST_HEROESCAVE02, $4a
	
HeroesCave02_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  5, HEROES_CAVE_01, 2
	warp_event  6,  0, HEROES_CAVE_03, 1
	warp_event  6,  9, HEROES_CAVE_01, 1

	def_coord_events

	def_bg_events
	
	def_object_events
	object_event  5,  5, SPRITE_ITTIBAT, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_OWMON, 3, HeroesCave02RoamingMonIttibat01, -1
	object_event 12,  5, SPRITE_NOTHING, SPRITEMOVEDATA_STILL,  0, 0, -1, -1,           -1, OBJECTTYPE_TREASURECHEST, 0, HeroesCave02TreasureChest, EVENT_TREASURECHEST_HEROESCAVE02

