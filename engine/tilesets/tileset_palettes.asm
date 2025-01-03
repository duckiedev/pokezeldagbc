LoadSpecialMapPalette:
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion
	cp TILESET_OVERWORLD_MAIN
	jr z, .overworld_main
	cp TILESET_OVERWORLD_MAIN_TWO
	jr z, .overworld_main
	cp TILESET_CAVE_MAIN
	jr z, .cave_main
	cp TILESET_GATE_OF_TIME
	jr z, .gate_of_time
	cp TILESET_SIDESCROLLTEST
	jr z, .sidescrolltest
	cp TILESET_DEBUG_MAP
	jr z, .debug_map
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion
	call LoadMansionPalette
	scf
	ret

.overworld_main
	call LoadOverworldMainPalette
	scf
	ret

.cave_main
	call LoadCaveMainPalette
	scf
	ret

.gate_of_time
	call LoadGateOfTimePalette
	scf
	ret

.sidescrolltest
	call LoadSidescrollTestPalette
	scf 
	ret

.forest_gate_sidescrolling
	call LoadForestGateSidescrollingPalette
	scf 
	ret 

.debug_map
	call LoadDebugMapPalette
	scf
	ret

.do_nothing
	and a
	ret

LoadPokeComPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, PokeComPalette
	ld bc, 8 palettes
    jmp FarCopyWRAM

PokeComPalette:
INCLUDE "gfx/tilesets/pokecom_center.pal"

LoadIcePathPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, IcePathPalette
	ld bc, 8 palettes
    jmp FarCopyWRAM

IcePathPalette:
INCLUDE "gfx/tilesets/ice_path.pal"

LoadHousePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, HousePalette
	ld bc, 8 palettes
    jmp FarCopyWRAM

HousePalette:
INCLUDE "gfx/tilesets/house.pal"

LoadRadioTowerPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
    jmp FarCopyWRAM

RadioTowerPalette:
INCLUDE "gfx/tilesets/radio_tower.pal"

MansionPalette1:
INCLUDE "gfx/tilesets/mansion_1.pal"

LoadMansionPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_YELLOW
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_WATER
	ld hl, MansionPalette1 palette 6
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 palette PAL_BG_ROOF
	ld hl, MansionPalette1 palette 8
	ld bc, 1 palettes
    jmp FarCopyWRAM

MansionPalette2:
INCLUDE "gfx/tilesets/mansion_2.pal"

LoadOverworldMainPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, OverworldMainPalette
	ld bc, 8 palettes
 	jmp FarCopyWRAM
	
OverworldMainPalette:
INCLUDE "gfx/tilesets/overworld_main.pal"

LoadCaveMainPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, CaveMainPalette
	ld bc, 8 palettes
 	jmp FarCopyWRAM

CaveMainPalette:
INCLUDE "gfx/tilesets/cave_main.pal"

LoadGateOfTimePalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, GateOfTimePalette
	ld bc, 8 palettes
 	jmp FarCopyWRAM

GateOfTimePalette:
INCLUDE "gfx/tilesets/gate_of_time.pal"

LoadSidescrollTestPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, SidescrollTestPalette
	ld bc, 8 palettes
 	jmp FarCopyWRAM

SidescrollTestPalette:
INCLUDE "gfx/tilesets/sidescrolltest.pal"

LoadForestGateSidescrollingPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, ForestGateSidescrollingPalette
	ld bc, 8 palettes
 	jmp FarCopyWRAM

ForestGateSidescrollingPalette:
INCLUDE "gfx/tilesets/forest_gate_sidescrolling.pal"

LoadDebugMapPalette:
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, DebugMapPalette
	ld bc, 8 palettes
 	jmp FarCopyWRAM

DebugMapPalette:
INCLUDE "gfx/tilesets/debug_map.pal"
