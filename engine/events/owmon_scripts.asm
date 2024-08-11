TalkToOWMonScript::
	faceplayer
	;owmonflagaction CHECK_FLAG
	;iftrue AlreadyBeatenTrainerScript
	;encountermusic
	sjump StartBattleWithMapOWMonScript

SeenByOWMonScript::
	;encountermusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	sjump StartBattleWithMapOWMonScript

StartBattleWithMapOWMonScript:
	;opentext
	;trainertext TRAINERTEXT_SEEN
	;waitbutton
	;closetext
	;loadtempowmon
	startbattle
	reloadmapafterbattle
	owmonflagaction SET_FLAG
	loadmem wRunningOWMonBattleScript, -1

;AlreadyBeatenTrainerScript:
;	scripttalkafter
