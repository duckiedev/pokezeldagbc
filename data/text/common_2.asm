_NameRaterHelloText::
	text "Hello, hello! I'm"
	line "the NAME RATER."

	para "I rate the names"
	line "of #MON."

	para "Would you like me"
	line "to rate names?"
	done

_NameRaterWhichMonText::
	text "Which #MON's"
	line "nickname should I"
	cont "rate for you?"
	prompt

_NameRaterBetterNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "…"
	line "That's a fairly"
	cont "decent name."

	para "But, how about a"
	line "slightly better"
	cont "nickname?"

	para "Want me to give it"
	line "a better name?"
	done

_NameRaterWhatNameText::
	text "All right. What"
	line "name should we"
	cont "give it, then?"
	prompt

_NameRaterFinishedText::
	text "That's a better"
	line "name than before!"

	para "Well done!"
	done

_NameRaterComeAgainText::
	text "OK, then. Come"
	line "again sometime."
	done

_NameRaterPerfectNameText::
	text "Hm… @"
	text_ram wStringBuffer1
	text "?"
	line "What a great name!"
	cont "It's perfect."

	para "Treat @"
	text_ram wStringBuffer1
	text_start
	line "with loving care."
	done

_NameRaterSameNameText::
	text "It might look the"
	line "same as before,"

	para "but this new name"
	line "is much better!"

	para "Well done!"
	done

_NameRaterNamedText::
	text "All right. This"
	line "#MON is now"
	cont "named @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " gained@"
	text_end

_BoostedExpPointsText::
	text_start
	line "a boosted"
	cont "@"
	text_decimal wStringBuffer2, 2, 5
	text " EXP. Points!"
	prompt

_ExpPointsText::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 5
	text " EXP. Points!"
	prompt

_GoMonText::
	text "Go! @"
	text_end

_DoItMonText::
	text "Do it! @"
	text_end

_GoForItMonText::
	text "Go for it,"
	line "@"
	text_end

_YourFoesWeakGetmMonText::
	text "Your foe's weak!"
	line "Get'm, @"
	text_end

_BattleMonNicknameText::
	text_ram wBattleMonNickname
	text "!"
	done

_BattleMonNickCommaText::
	text_ram wBattleMonNickname
	text ",@"
	text_end

_ThatsEnoughComeBackText::
	text " that's"
	line "enough! Come back!@"
	text_end

_OKComeBackText::
	text " OK!"
	line "Come back!@"
	text_end

_GoodComeBackText::
	text " good!"
	line "Come back!@"
	text_end

_ComeBackText::
	text " come"
	line "back!"
	done

_BootedTMText::
	text "Booted up a TM."
	prompt

_BootedHMText::
	text "Booted up an HM."
	prompt

_ContainedMoveText::
	text "It contained"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Teach @"
	text_ram wStringBuffer2
	text_start
	line "to a #MON?"
	done

_TMHMNotCompatibleText::
	text_ram wStringBuffer2
	text " is"
	line "not compatible"
	cont "with @"
	text_ram wStringBuffer1
	text "."

	para "It can't learn"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_NoRoomTMHMText::
	text "You have no room"
	line "for any more"
	cont "@"
	text_ram wStringBuffer1
	text "S."
	prompt

_ReceivedTMHMText::
	text "You received"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

_BadgeRequiredText::
	text "Sorry! A new BADGE"
	line "is required."
	prompt

_CantUseItemText::
	text "Can't use that"
	line "here."
	prompt

_UseCutText::
	text_ram wStringBuffer2
	text " used"
	line "CUT!"
	prompt

_CutNothingText::
	text "There's nothing to"
	line "CUT here."
	prompt

_BlindingFlashText::
	text "A blinding FLASH"
	line "lights the area!@"
	text_promptbutton
	text_end

_UsedSurfText::
	text_ram wStringBuffer2
	text " used"
	line "SURF!"
	done

_CantSurfText::
	text "You can't SURF"
	line "here."
	prompt

_AlreadySurfingText::
	text "You're already"
	line "SURFING."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Want to SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " used"
	line "WATERFALL!"
	done

_HugeWaterfallText::
	text "Wow, it's a huge"
	line "waterfall."
	done

_AskWaterfallText::
	text "Do you want to use"
	line "WATERFALL?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "DIG!"
	done

_UseEscapeRopeText::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done

_CantUseDigText::
	text "Can't use that"
	line "here."
	done

_TeleportReturnText::
	text "Return to the last"
	line "#MON CENTER."
	done

_CantUseTeleportText::
	text "Can't use that"
	line "here."

	para ""
	done

_AlreadyUsingStrengthText::
	text "A #MON is using"
	line "STRENGTH already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

_AskStrengthText::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done

_BouldersMoveText::
	text "Boulders may now"
	line "be moved!"
	done

_BouldersMayMoveText::
	text "A #MON may be"
	line "able to move this."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt

_MayPassWhirlpoolText::
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done

_AskWhirlpoolText::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Nothing…"
	done

_AskHeadbuttText::
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt

_MaySmashText::
	text "Maybe a #MON"
	line "can break this."
	done

_AskRockSmashText::
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done

_RodBiteText::
	text "Oh!"
	line "A bite!"
	prompt

_RodNothingText::
	text "Not even a nibble!"
	prompt

_UnusedNothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

_CantGetOffBikeText::
	text "You can't get off"
	line "here!"
	done

_GotOnBikeText::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "This can be"
	line "SLASHed!"

	para "Want to use"
	line "SLASH?"
	done

_CanCutText::
	text "This can be"
	line "SLASHed!"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

_WhitedOutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done

_ItemfinderItemNearbyText::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

_ItemfinderNopeText::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

_PoisonFaintText::
	text_ram wStringBuffer3
	text_start
	line "fainted!"
	prompt

_UseSweetScentText::
	text_ram wStringBuffer3
	text " used"
	line "SWEET SCENT!"
	done

_SweetScentNothingText::
	text "Looks like there's"
	line "nothing here…"
	done

_SquirtbottleNothingText::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

_UseSacredAshText::
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done

_PackNoItemText::
	text "No items."
	done

_AskThrowAwayText::
	text "Throw away how"
	line "many?"
	done

_AskQuantityThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ThrewAwayText::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_OakThisIsntTheTimeText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

_YouDontHaveAMonText::
	text "You don't have a"
	line "#MON!"
	prompt

_RegisteredItemText::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_CantRegisterText::
	text "You can't register"
	line "that item."
	prompt

_AskItemMoveText::
	text "Where should this"
	line "be moved to?"
	done

_PackEmptyText::
	text_start
	done

_YouCantUseItInABattleText::
	text "You can't use it"
	line "in a battle."
	prompt

_AreYouABoyOrAreYouAGirlText::
	text "Are you a boy or"
	line "a girl?"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

_BattleStatWentWayUpText::
	text_pause
	text " went way up!"
	prompt

_BattleStatWentUpText::
	text " went up!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	text_end

_BattleStatSharplyFellText::
	text_pause
	text "sharply fell!"
	prompt

_BattleStatFellText::
	text " fell!"
	prompt

Text_BattleUser::
	text "<USER>@"
	text_end

_BattleMadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "took in sunlight!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "lowered its head!"
	prompt

_BattleGlowingText::
	text_start
	line "is glowing!"
	prompt

_BattleFlewText::
	text_start
	line "flew up high!"
	prompt

_BattleDugText::
	text_start
	line "dug a hole!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMoveText::
	text_start
	line "used @"
	text_end

_UsedInsteadText::
	text "instead,"
	cont "@"
	text_end

_MoveNameText::
	text_ram wStringBuffer2
	text "!"
	done

_WasSentToBillsPCText::
	text_ram wStringBuffer1
	text " was"
	line "sent to BILL's PC."
	prompt

_PCGottaHavePokemonText::
	text "You gotta have"
	line "#MON to call!"
	prompt

_PCWhatText::
	text "What?"
	done

_PCNoSingleMonText::
	text "You don't have a"
	line "single #MON!"
	prompt

_PCCantDepositLastMonText::
	text "You can't deposit"
	line "your last #MON!"
	prompt

_PCCantTakeText::
	text "You can't take any"
	line "more #MON."
	prompt

_CaughtAskNicknameText::
	text "Give it a nick-"
	line "name?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PlayersPCAskWhatDoText::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

_PlayersPCNoItemsText::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PokecenterPCWhoseText::
	text "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link closed…"
	done

_OakPCText1::
	text "Want to get your"
	line "#DEX rated?"
	done

_OakPCText2::
	text "Current #DEX"
	line "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_ram wStringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #MON"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#MON grow,"

	para "others use the"
	line "effects of STONES."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met KURT?"
	line "His custom BALLS"
	cont "should help."
	done

_OakRating13::
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done

_OakRating14::
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done

_OakRating18::
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The link to PROF."
	line "OAK's PC closed."
	done

_MemoryGameYeahText::
	text " , yeah!"
	done

_MemoryGameDarnText::
	text "Darn…"
	done

_ItemsTossOutHowManyText::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChange, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsDiscardedText::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(S)."
	prompt

_ItemsTooImportantText::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

_PokemonSwapItemText::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Made @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

_ItemStorageFullText::
	text "Item storage space"
	line "full."
	prompt

_PokemonTookItemText::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

_ItemCantHeldText::
	text "This item can't be"
	line "held."
	prompt

_PokemonNotEnoughHPText::
	text "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "on SELECT Button."
	done

_OakText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

	para "Welcome to the"
	line "world of #MON!"

	para "My name is OAK."

	para "People call me the"
	line "#MON PROF."
	prompt

_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#MON.@"
	text_end

_OakText3::
	text_promptbutton
	text_end

_OakText4::
	text "People and #MON"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #MON, some"
	cont "battle with them."
	prompt

_OakText5::
	text "But we don't know"
	line "everything about"
	cont "#MON yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#MON every day."
	prompt

_AskVineWhipText::
	text "Something could"
	line "latch on over"
	line "there…"
	
	para "Want to use"
	line "VINE WHIP?"
	done

_UsedVineWhipText::
	text_ram wStringBuffer2
	text " used"
	line "VINE WHIP!"
	prompt

_CantVineWhipText::
	text "Something could"
	line "latch on over"
	cont "there…"
	prompt

_CantDepositText::
	text "Can't deposit"
	line "this item."
	prompt
