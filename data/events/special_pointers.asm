; Special routines can be used with the "special" map script command.
; They often use wScriptVar for arguments and return values.

MACRO add_special
\1Special::
	dba \1
ENDM

SpecialsPointers::
	add_special WarpToSpawnPoint

; Map events
	add_special HealParty ; this is both a special and a predef
	add_special PokemonCenterPC
	add_special PlayersHousePC
	add_special MoveDeletion
	add_special BankOfMom
	add_special MagnetTrain
	add_special NameRival
	add_special SetDayOfWeek
	add_special OverworldTownMap
	add_special UnownPuzzle
	add_special SlotMachine
	add_special CardFlip
	add_special BreakoutGame
	add_special UnusedMemoryGame ; unused
	add_special ClearBGPalettesBufferScreen ; unused
	add_special FadeOutPalettes
	add_special FadeBlackQuickly
	add_special FadeInPalettes
	add_special FadeInQuickly
	add_special ReloadSpritesNoPalettes ; bank 0
	add_special ClearBGPalettes ; bank 0
	add_special UpdateTimePals ; bank 0
	add_special ClearTilemap ; bank 0; unused as special
	add_special UpdateSprites ; bank 0
	add_special UpdatePlayerSprite ; bank 0
	add_special GameCornerPrizeMonCheckDex
	add_special UnusedSetSeenMon ; unused
	add_special WaitSFX ; bank 0
	add_special PlayMapMusic ; bank 0
	add_special RestartMapMusic ; bank 0
	add_special HealMachineAnim
	add_special SurfStartStep
	add_special FindPartyMonAboveLevel ; unused
	add_special FindPartyMonAtLeastThatHappy ; unused
	add_special FindPartyMonThatSpecies
	add_special FindPartyMonThatSpeciesYourTrainerID
	add_special ActivateFishingSwarm
	add_special CheckPokerus
	add_special DisplayCoinCaseBalance
	add_special DisplayMoneyAndCoinBalance
	add_special PlaceMoneyTopRight
	add_special SelectApricornForKurt
	add_special NameRater
	add_special GetFirstPokemonHappiness
	add_special LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special SnorlaxAwake
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special GameboyCheck
	add_special TrainerHouse
	add_special InitRoamMons
	add_special FadeOutMusic
	add_special Diploma

; Crystal only
	add_special Reset ; bank 0
	add_special MoveTutor
	add_special CelebiShrineEvent
	add_special CheckCaughtCelebi
	add_special PokeSeer
	add_special GiveDratini
	add_special BeastsCheck
	add_special MonCheck
	add_special RefreshSprites
	add_special LoadMapPalettes

	add_special _InitClock
	add_special _InitializeStartDay

	add_special InitialSetDSTFlag
	add_special InitialClearDSTFlag

	add_special FadeInPalettes_EnableDynNoApply
