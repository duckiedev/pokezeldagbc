	db HONEDGE_H ; 252

	db  45,  80, 100,  28,  35,  37
	;   hp  atk  def  spd  sat  sdf
	
	db FOREST, WARRIOR ; type
	db 50 ; catch rate
	db 65 ; base exp
	db LEFTOVERS, LEFTOVERS ; items
	db GENDER_F50 ; gender ratio
	db 1 ; hearts (more than 1 is considered a boss)
    db 0 ; unused1
	db 5 ; form pic bank
	INCBIN "gfx/pokemon/honedge_h/front.dimensions"
	dw NULL, NULL ; Form pics
	db GROWTH_MEDIUM_SLOW ; growth rate
    db 0 ; unused2
	
	; tm/hm learnset
	tmhm HIDDEN_POWER, PROTECT, ENDURE, DETECT, CUT
	;end
