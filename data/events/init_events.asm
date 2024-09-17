InitialEvents:
	dw EVENT_EARLS_ACADEMY_EARL
	; ...
	dw EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	dw EVENT_INITIALIZED_EVENTS
	dw -1 ; end

InitialEngineFlags:
	dw ENGINE_ROCKET_SIGNAL_ON_CH20
	dw ENGINE_ROCKETS_IN_MAHOGANY
	dw -1 ; end

InitialVariableSprites:
MACRO initvarsprite
; variable sprite, appearance sprite
	db \1 - SPRITE_VARS, \2
ENDM
	initvarsprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	initvarsprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	initvarsprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	initvarsprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	initvarsprite SPRITE_COPYCAT, SPRITE_LASS
	initvarsprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	db -1 ; end