	db HONEDGE_HYRULEAN ; 252

	db  45,  80, 100,  28,  35,  37
	;   hp  atk  def  spd  sat  sdf
	
	db FOREST, WARRIOR ; type
	db 50 ; catch rate
	db 65 ; base exp
	db LEFTOVERS, LEFTOVERS ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 40 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/honedge_hyrulean/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups
	
	; tm/hm learnset
	tmhm HIDDEN_POWER, PROTECT, ENDURE, DETECT, CUT
	;end
