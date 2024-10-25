Crystal_FillBoxCGB:
; This is a copy of FillBoxCGB.
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

Crystal_WipeAttrmap:
; This is a copy of WipeAttrmap.
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
    jmp ByteFill

LoadOW_BGPal7::
	ld a, [wTextboxStyle]
	cp HYRULE
	ld hl, Palette_TextBG7_Hyrule
	jr z, .continue
	ld hl, Palette_TextBG7_Johto
.continue
	ld de, wBGPals1 palette PAL_BG_TEXT
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
    jmp FarCopyWRAM

Palette_TextBG7_Hyrule:
INCLUDE "gfx/font/bg_text_hyrule.pal"

Palette_TextBG7_Johto:
INCLUDE "gfx/font/bg_text_johto.pal"

INCLUDE "engine/tilesets/tileset_palettes.asm"
