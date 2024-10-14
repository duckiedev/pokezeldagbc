Script_BattleWhiteout::
	callasm BattleBGMap
	sjump Script_Whiteout

OverworldWhiteoutScript::
	reanchormap
	callasm OverworldBGMap

Script_Whiteout:
	writetext .WhitedOutText
	waitbutton
	special FadeOutPalettes
	pause 40
	special HealParty
	callasm HalveMoney
	callasm GetWhiteoutSpawn
	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
	endall

.WhitedOutText:
	text_far _WhitedOutText
	text_end

OverworldBGMap:
	farcall FadeOutPalettes
	call ClearTilemap
	call ClearSprites
	ld a, CGB_PLAIN
	call GetSGBLayout
	jmp SetDefaultBGPAndOBP
	ret

BattleBGMap:
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	ret

HalveMoney:

; Halve the player's money.
	ld hl, wMoney
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	ret

GetWhiteoutSpawn:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret
