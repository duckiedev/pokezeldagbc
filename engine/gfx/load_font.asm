INCLUDE "gfx/font.asm"

EnableHDMAForGraphics:
	db FALSE

Get1bppOptionalHDMA: ; unreferenced
	ld a, [EnableHDMAForGraphics]
	and a
	jp nz, Get1bppViaHDMA
	jp Get1bpp

Get2bppOptionalHDMA: ; unreferenced
	ld a, [EnableHDMAForGraphics]
	and a
	jp nz, Get2bppViaHDMA
	jp Get2bpp

_LoadStandardFont::
	ld de, Font
	ld hl, vTiles1
	lb bc, BANK(Font), $70
	call Get2bpp
	ld de, TextboxSpaceUniqueGFX
	ld hl, vTiles2 tile " "
	lb bc, BANK(TextboxSpaceUniqueGFX), 1
	call Get2bpp
	ret

_LoadFontsBattleExtra::
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 25
	call Get2bppViaHDMA
	ret

LoadBattleFontsHPBar:
	ld de, FontBattleExtra
	ld hl, vTiles2 tile $60
	lb bc, BANK(FontBattleExtra), 12
	call Get2bppViaHDMA
	ld hl, vTiles2 tile $70
	ld de, FontBattleExtra + 16 tiles ; "<DO>"
	lb bc, BANK(FontBattleExtra), 3 ; "<DO>" to "『"
	call Get2bppViaHDMA

LoadHPBar:
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles0 tile $BB
	lb bc, BANK(ExpBarGFX), 15
	call Get2bppViaHDMA
	ret

StatsScreen_LoadFont:
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, vTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX
	ld hl, vTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bppViaHDMA
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, vTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bppViaHDMA
	ld de, ExpBarGFX
	ld hl, vTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bppViaHDMA
LoadStatsScreenPageTilesGFX:
	ld de, StatsScreenPageTilesGFX
	ld hl, vTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), 17
	call Get2bppViaHDMA
	ret
