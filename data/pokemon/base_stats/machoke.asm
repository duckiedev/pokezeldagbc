	db MACHOKE ; 067

	db  80, 100,  70,  45,  50,  60
	;   hp  atk  def  spd  sat  sdf

	db WARRIOR, WARRIOR ; type
	db 90 ; catch rate
	db 146 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 1 ; hearts (more than 1 is considered a boss)
    db 0 ; unused1
	db 5 ; form pic bank
	INCBIN "gfx/pokemon/machoke/front.dimensions"
	dw NULL, NULL ; Form pics
	db GROWTH_MEDIUM_SLOW ; growth rate
    db 0 ; unused2

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, DETECT, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH, FLAMETHROWER
	; end
