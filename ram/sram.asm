SECTION "Scratch", SRAM

sScratch:: ds $60 tiles


SECTION "SRAM Bank 0", SRAM

ds $661

sRTCStatusFlags:: db
	ds 7
sLuckyNumberDay:: db
sLuckyIDNumber::  dw


SECTION "Backup Save", SRAM

sBackupOptions:: ds wOptionsEnd - wOptions

sBackupCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sBackupGameData::
sBackupPlayerData::  ds wPlayerDataEnd - wPlayerData
sBackupCurMapData::  ds wCurMapDataEnd - wCurMapData
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupGameDataEnd::

	ds $18a

sBackupChecksum:: dw

sBackupCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption

sStackTop:: dw

if DEF(_DEBUG)
sRTCHaltCheckValue:: dw
sSkipBattle:: db
sDebugTimeCyclesSinceLastCall:: db
sOpenedInvalidSRAM:: db
sIsBugMon:: db
endc


SECTION "Save", SRAM

sOptions:: ds wOptionsEnd - wOptions

sCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sGameData::
sPlayerData::  ds wPlayerDataEnd - wPlayerData
sCurMapData::  ds wCurMapDataEnd - wCurMapData
sPokemonData:: ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

	ds $18a

sChecksum:: dw

sCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption


SECTION "Active Box", SRAM

sBox:: box sBox

	ds $100

SECTION "SRAM Hall of Fame", SRAM

sHallOfFame::
; sHallOfFame1 - sHallOfFame30
for n, 1, NUM_HOF_TEAMS + 1
sHallOfFame{d:n}:: hall_of_fame sHallOfFame{d:n}
endr
sHallOfFameEnd::


SECTION "SRAM Crystal Data", SRAM

sGSBallFlag:: db

sCrystalData:: ds wCrystalDataEnd - wCrystalData

sGSBallFlagBackup:: db


; The PC boxes will not fit into one SRAM bank,
; so they use multiple SECTIONs
DEF box_n = 0
MACRO boxes
	rept \1
		DEF box_n += 1
	sBox{d:box_n}:: box sBox{d:box_n}
	endr
ENDM

SECTION "Boxes 1-7", SRAM

; sBox1 - sBox7
	boxes 7

SECTION "Boxes 8-14", SRAM

; sBox8 - sBox14
	boxes 7

; All 14 boxes fit exactly within 2 SRAM banks
	assert box_n == NUM_BOXES, \
		"boxes: Expected {d:NUM_BOXES} total boxes, got {d:box_n}"
