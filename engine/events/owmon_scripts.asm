TalkToOWMonScript::
	faceplayer
	;owmonflagaction CHECK_FLAG
	;iftrue AlreadyBeatenTrainerScript
	;encountermusic
	sjump StartBattleWithMapOWMonScript

SeenByOWMonScript::
	;encountermusic
	;callasm .breakpoint
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovementlasttalked wMovementBuffer
	writeobjectxy LAST_TALKED
	faceobject PLAYER, LAST_TALKED
	sjump StartBattleWithMapOWMonScript
;.breakpoint
	;ld b, b
	;ret

StartBattleWithMapOWMonScript:
	;opentext
	;trainertext TRAINERTEXT_SEEN
	;waitbutton
	;closetext
	;loadtempowmon
	startbattle
	ifequal WIN, .RunAfterBattle
	loadmem wRunningOWMonBattleScript, -1
	end

.RunAfterBattle
	reloadmapafterbattle
	owmonflagaction SET_FLAG
	disappear LAST_TALKED
	owmonafterbattle

;AlreadyBeatenTrainerScript:
;	scripttalkafter
