BattleCommand_LeechSeed:
	ld a, [wAttackMissed]
	and a
	jr nz, .evaded
	call CheckSubstituteOpp
	jr nz, .evaded

	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok

	ld a, [de]
	cp FOREST
	jr z, .forest
	inc de
	ld a, [de]
	cp FOREST
	jr z, .forest

	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr nz, .evaded
	set SUBSTATUS_LEECH_SEED, [hl]
	call AnimateCurrentMove
	ld hl, WasSeededText
 	jmp StdBattleTextbox

.forest
	call AnimateFailedMove
 	jmp PrintDoesntAffect

.evaded
	call AnimateFailedMove
	ld hl, DodgedText
 	jmp StdBattleTextbox
