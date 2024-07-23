LoadZeldaFont::
	ld de, .ZeldaFontGFX
	ld hl, vTiles1
	lb bc, BANK(.ZeldaFontGFX), $80
	call Get2bpp
	ld de, .ZeldaFontSpaceGFX
	ld hl, vTiles2 tile " "
	lb bc, BANK(.ZeldaFontSpaceGFX), 1
	call Get2bpp
	ret

.ZeldaFontGFX:
INCBIN "gfx/font/zelda.2bpp"

.ZeldaFontSpaceGFX:
INCBIN "gfx/font/zelda_space.2bpp"
