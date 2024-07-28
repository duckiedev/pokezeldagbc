	object_const_def
	const CAVEH8_OLDMAN
	const CAVEH8_HONEDGE
	const CAVEH8_CUTBUSH

CaveH8_MapScripts:
	def_scene_scripts
	scene_script CaveH8_ItsDangerousToGoAloneScene, SCENE_CAVE_H8_OLDMAN_DANGEROUS_TO_GO_ALONE
	scene_script CaveH8NoopScene, SCENE_CAVE_H8_NOOP

	def_callbacks

CaveH8NoopScene:
	end

CaveH8_ItsDangerousToGoAloneScene:
	applymovement PLAYER, CaveH8_WalkUpToOldManMovement
	showemote EMOTE_SHOCK, CAVEH8_OLDMAN, 15
	reanchormap
	opentext
	writetext OldManText_ItsDangerous
	waitbutton
	closetext
	applymovement CAVEH8_OLDMAN, CaveH8_TurnToPokemon
	pause 30
	disappear CAVEH8_HONEDGE
	pause 30
	applymovement CAVEH8_OLDMAN, CaveH8_WalkDownToPlayer
	opentext
	writetext OldManText_TakeThis
	waitbutton
	closetext
	pokepic HONEDGE_H
	cry HONEDGE_H
	waitbutton
	closepokepic
	setevent EVENT_GOT_HONEDGE_FROM_OLDMAN
	getmonname STRING_BUFFER_3, HONEDGE_H
	opentext
	writetext ReceivedHonedgeText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CAVEH8_OLDMAN, CaveH8_TeleportOut
	waitsfx
	disappear CAVEH8_OLDMAN
	opentext
	givepoke HONEDGE_H, 5, BERRY
	closetext
	setscene SCENE_CAVE_H8_NOOP
	end
	
CaveH8_RevealDoor:
	checkevent EVENT_CAVEH8_HIDDEN_DOOR_REVEALED
	iftrue .AlreadyRevealed
	checkevent EVENT_GOT_HONEDGE_FROM_OLDMAN
	opentext
	iftrue .AskToCut
	farwritetext _CanCutText
	closetext
	end

.AskToCut
	farwritetext _AskCutText
	closetext
	callasm .OWCutAnimation

	;callasm GetPartyNickname
	;writetext UseCutText
	;refreshmap
	;callasm CutDownTreeOrGrass
	;closetext
	end

.OWCutAnimation:
	farcall OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	call DelayFrame
	call LoadStandardFont
	ret

.AlreadyRevealed
	end

OldManText_ItsDangerous:
	text "It's dangerous to"
	line "go alone…"
	done
	
OldManText_TakeThis:
	text "Take this!"
	done

ReceivedHonedgeText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

CaveH8_WalkUpToOldManMovement:
	step UP
	step UP
	step UP
	step_end

CaveH8_TurnToPokemon:
	turn_step RIGHT
	step_end

CaveH8_WalkDownToPlayer:
	turn_step DOWN
	slow_step DOWN
	step_end

CaveH8_TeleportOut:
	teleport_to
	step_end

CaveH8_HonedgeScript:
	pokepic HONEDGE_H
	cry HONEDGE_H
	waitbutton
	closepokepic
	end

CaveH8_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  8, FOREST_AREA_H8, 1
	warp_event  9,  2, PLAYERS_HOUSE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  3, SPRITE_OLDMAN, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, -1, -1
	object_event  6,  3, SPRITE_HONEDGE_H, SPRITEMOVEDATA_POKEMON, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CaveH8_HonedgeScript, -1
	object_event  9,  7, SPRITE_OLDMAN, SPRITEMOVEDATA_STILL, -1, -1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CaveH8_RevealDoor, -1
