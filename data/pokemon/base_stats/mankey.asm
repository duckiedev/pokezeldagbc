	db MANKEY ; 056

	db  40,  80,  35,  70,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db WARRIOR, WARRIOR ; type
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 1 ; hearts (more than 1 is considered a boss)
    db 0 ; unused1
	db 5 ; form pic bank
	INCBIN "gfx/pokemon/mankey/front.dimensions"
	dw NULL, NULL ; Form pics
	db GROWTH_MEDIUM_FAST ; growth rate
    db 0 ; unused2

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, THUNDERPUNCH, DETECT, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH, THUNDERBOLT
	; end
