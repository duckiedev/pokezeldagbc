	db WOBBUFFET ; 202

	db 190,  33,  58,  33,  33,  58
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 177 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 1 ; hearts (more than 1 is considered a boss)
	db 20 ; step cycles to hatch
	db 5 ; form pic bank
	INCBIN "gfx/pokemon/wobbuffet/front.dimensions"
	dw NULL, NULL ; Form pics
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm
	; end
