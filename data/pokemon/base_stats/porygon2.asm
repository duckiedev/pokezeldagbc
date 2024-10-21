	db PORYGON2 ; 233

	db  85,  80,  90,  60, 105,  95
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 180 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 1 ; hearts (more than 1 is considered a boss)
    db 0 ; unused1
	db 5 ; form pic bank
	INCBIN "gfx/pokemon/porygon2/front.dimensions"
	dw NULL, NULL ; Form pics
	db GROWTH_MEDIUM_FAST ; growth rate
    db 0 ; unused2

	; tm/hm learnset
	tmhm CURSE, TOXIC, ZAP_CANNON, PSYCH_UP, HIDDEN_POWER, SUNNY_DAY, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SWIFT, DEFENSE_CURL, DREAM_EATER, REST, THIEF, NIGHTMARE, FLASH, THUNDERBOLT, ICE_BEAM
	; end
