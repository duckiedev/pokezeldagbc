StatNames:
; entries correspond to stat ids
	list_start StatNames
	li "ATTACK"
	li "DEFENSE"
	li "SPEED"
	li "SPCL.ATK"
	li "SPCL.DEF"
	li "ACCURACY"
	li "EVASION"
	li "ABILITY" ; used for BattleCommand_Curse
	li "HEARTS"
	assert_list_length NUM_LEVEL_STATS
