InitialEvents:
	dw EVENT_GOT_POWERSNEAKERS
	dw EVENT_INITIALIZED_EVENTS
	dw -1 ; end

InitialEngineFlags:
	dw ENGINE_POKEGEAR
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