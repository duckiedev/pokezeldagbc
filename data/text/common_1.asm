_FruitBearingTreeText::
	text "It's a fruit-"
	line "bearing tree."
	done

_HeyItsFruitText::
	text "Hey! It's"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Obtained"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "But the PACK is"
	line "full…"
	done

_NothingHereText::
	text "There's nothing"
	line "here…"
	done

_WhichApricornText::
	text "Which APRICORN"
	line "should I use?"
	done

_HowManyShouldIMakeText::
	text "How many should I"
	line "make?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "recovered @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "HP!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text "'s"
	line "cured of poison."
	done

_RidOfParalysisText::
	text_ram wStringBuffer1
	text "'s"
	line "rid of paralysis."
	done

_BurnWasHealedText::
	text_ram wStringBuffer1
	text "'s"
	line "burn was healed."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "was defrosted."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "woke up."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text "'s"
	line "health returned."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "is revitalized."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_promptbutton
	text_end

_CameToItsSensesText::
	text_ram wStringBuffer1
	text " came"
	line "to its senses."
	done

_OakTimeWhatHoursText::
	text "What?@"
	text_end

_TimeQuestionMarkText::
	text "?"
	done

_OakTimeWhoaMinutesText::
	text "Whoa!@"
	text_end

_OakTimeWhatDayIsItText::
	text "What day is it?"
	done

_OakTimeIsItText::
	text ", is it?"
	done

_MonWasSentToText::
	text_ram wPlayerTrademonSpeciesName
	text " was"
	line "sent to @"
	text_ram wOTTrademonSenderName
	text "."
	done

_MonNameSentToText::
	text_start
	done

_BidsFarewellToMonText::
	text_ram wOTTrademonSenderName
	text " bids"
	line "farewell to"
	done

_MonNameBidsFarewellText::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TakeGoodCareOfMonText::
	text "Take good care of"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_ForYourMonSendsText::
	text "For @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text ","
	done

_OTSendsText::
	text_ram wOTTrademonSenderName
	text " sends"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_WillTradeText::
	text_ram wOTTrademonSenderName
	text " will"
	line "trade @"
	text_ram wOTTrademonSpeciesName
	text_end

_ForYourMonWillTradeText::
	text "for @"
	text_ram wPlayerTrademonSenderName
	text "'s"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "."
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "MARY: PROF.OAK'S"
	done

_OPT_IntroText2::
	text_start
	line "#MON TALK!"
	done

_OPT_IntroText3::
	text_start
	line "With me, MARY!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

_OPT_OakText2::
	text_start
	line "may be seen around"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "MARY: @"
	text_ram wStringBuffer1
	text "'s"
	done

_OPT_SweetAdorablyText::
	text_start
	line "sweet and adorably"
	done

_OPT_WigglySlicklyText::
	text_start
	line "wiggly and slickly"
	done

_OPT_AptlyNamedText::
	text_start
	line "aptly named and"
	done

_OPT_UndeniablyKindOfText::
	text_start
	line "undeniably kind of"
	done

_OPT_UnbearablyText::
	text_start
	line "so, so unbearably"
	done

_OPT_WowImpressivelyText::
	text_start
	line "wow, impressively"
	done

_OPT_AlmostPoisonouslyText::
	text_start
	line "almost poisonously"
	done

_OPT_SensuallyText::
	text_start
	line "ooh, so sensually"
	done

_OPT_MischievouslyText::
	text_start
	line "so mischievously"
	done

_OPT_TopicallyText::
	text_start
	line "so very topically"
	done

_OPT_AddictivelyText::
	text_start
	line "sure addictively"
	done

_OPT_LooksInWaterText::
	text_start
	line "looks in water is"
	done

_OPT_EvolutionMustBeText::
	text_start
	line "evolution must be"
	done

_OPT_ProvocativelyText::
	text_start
	line "provocatively"
	done

_OPT_FlippedOutText::
	text_start
	line "so flipped out and"
	done

_OPT_HeartMeltinglyText::
	text_start
	line "heart-meltingly"
	done

_OPT_CuteText::
	text_start
	line "cute."
	done

_OPT_WeirdText::
	text_start
	line "weird."
	done

_OPT_PleasantText::
	text_start
	line "pleasant."
	done

_OPT_BoldSortOfText::
	text_start
	line "bold, sort of."
	done

_OPT_FrighteningText::
	text_start
	line "frightening."
	done

_OPT_SuaveDebonairText::
	text_start
	line "suave & debonair!"
	done

_OPT_PowerfulText::
	text_start
	line "powerful."
	done

_OPT_ExcitingText::
	text_start
	line "exciting."
	done

_OPT_GroovyText::
	text_start
	line "groovy!"
	done

_OPT_InspiringText::
	text_start
	line "inspiring."
	done

_OPT_FriendlyText::
	text_start
	line "friendly."
	done

_OPT_HotHotHotText::
	text_start
	line "hot, hot, hot!"
	done

_OPT_StimulatingText::
	text_start
	line "stimulating."
	done

_OPT_GuardedText::
	text_start
	line "guarded."
	done

_OPT_LovelyText::
	text_start
	line "lovely."
	done

_OPT_SpeedyText::
	text_start
	line "speedy."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "BEN: #MON MUSIC"
	done

_BenIntroText2::
	text_start
	line "CHANNEL!"
	done

_BenIntroText3::
	text_start
	line "It's me, DJ BEN!"
	done

_FernIntroText1::
	text_start
	line "FERN: #MUSIC!"
	done

_FernIntroText2::
	text_start
	line "With DJ FERN!"
	done

_BenFernText1::
	text_start
	line "Today's @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "so let us jam to"
	done

_BenFernText2B::
	text_start
	line "so chill out to"
	done

_BenFernText3A::
	text_start
	line "#MON March!"
	done

_BenFernText3B::
	text_start
	line "#MON Lullaby!"
	done

; Places and People

_PnP_Text1::
	text_start
	line "PLACES AND PEOPLE!"
	done

_PnP_Text2::
	text_start
	line "Brought to you by"
	done

_PnP_Text3::
	text_start
	line "me, DJ LILY!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

_PnP_CuteText::
	text_start
	line "is cute."
	done

_PnP_LazyText::
	text_start
	line "is sort of lazy."
	done

_PnP_HappyText::
	text_start
	line "is always happy."
	done

_PnP_NoisyText::
	text_start
	line "is quite noisy."
	done

_PnP_PrecociousText::
	text_start
	line "is precocious."
	done

_PnP_BoldText::
	text_start
	line "is somewhat bold."
	done

_PnP_PickyText::
	text_start
	line "is too picky!"
	done

_PnP_SortOfOKText::
	text_start
	line "is sort of OK."
	done

_PnP_SoSoText::
	text_start
	line "is just so-so."
	done

_PnP_GreatText::
	text_start
	line "is actually great."
	done

_PnP_MyTypeText::
	text_start
	line "is just my type."
	done

_PnP_CoolText::
	text_start
	line "is so cool, no?"
	done

_PnP_InspiringText::
	text_start
	line "is inspiring!"
	done

_PnP_WeirdText::
	text_start
	line "is kind of weird."
	done

_PnP_RightForMeText::
	text_start
	line "is right for me?"
	done

_PnP_OddText::
	text_start
	line "is definitely odd!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

_EnemyWithdrewText::
	text "<ENEMY>"
	line "withdrew"
	cont "@"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_EnemyUsedOnText::
	text "<ENEMY>"
	line "used @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "on @"
	text_ram wEnemyMonNickname
	text "!"
	prompt

_AskFloorElevatorText::
	text "Which floor?"
	done

_RepelWoreOffText::
	text "REPEL's effect"
	line "wore off."
	done

_PlayerFoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "But <PLAYER> has"
	line "no space left…"
	done

_SavingRecordText::
	text "SAVING RECORD…"
	line "DON'T TURN OFF!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_promptbutton
	text_end

_NoCoinsText::
	text "You have no coins."
	prompt

_NoCoinCaseText::
	text "You don't have a"
	line "COIN CASE."
	prompt

_NPCTradeCableText::
	text "OK, connect the"
	line "Game Link Cable."
	prompt

Text_NPCTraded::
	text "<PLAYER> traded"
	line "@"
	text_ram wMonOrItemNameBuffer
	text " for"
	cont "@"
	text_ram wStringBuffer2
	text ".@"
	text_end

_NPCTradeFanfareText::
	sound_dex_fanfare_80_109
	text_pause
	text_end

_NPCTradeIntroText1::
	text "I collect #MON."
	line "Do you have"
	cont "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "You don't want to"
	line "trade? Aww…"
	done

_NPCTradeWrongText1::
	text "Huh? That's not"
	line "@"
	text_ram wStringBuffer1
	text ". "
	cont "What a letdown…"
	done

_NPCTradeCompleteText1::
	text "Yay! I got myself"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Thanks!"
	done

_NPCTradeAfterText1::
	text "Hi, how's my old"
	line "@"
	text_ram wStringBuffer2
	text " doing?"
	done

_NPCTradeIntroText2::
	text "Hi, I'm looking"
	line "for this #MON."

	para "If you have"
	line "@"
	text_ram wStringBuffer1
	text ", would"

	para "you trade it for"
	line "my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "You don't have"
	line "one either?"

	para "Gee, that's really"
	line "disappointing…"
	done

_NPCTradeWrongText2::
	text "You don't have"
	line "@"
	text_ram wStringBuffer1
	text "? That's"
	cont "too bad, then."
	done

_NPCTradeCompleteText2::
	text "Great! Thank you!"

	para "I finally got"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Hi! The @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "you traded me is"
	cont "doing great!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text "'s cute,"
	line "but I don't have"

	para "it. Do you have"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Want to trade it"
	line "for my @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "You don't want to"
	line "trade? Oh, darn…"
	done

_NPCTradeWrongText3::
	text "That's not"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Please trade with"
	line "me if you get one."
	done

_NPCTradeCompleteText3::
	text "Wow! Thank you!"
	line "I always wanted"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "How is that"
	line "@"
	text_ram wStringBuffer2
	text " I"
	cont "traded you doing?"

	para "Your @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "so cute!"
	done

_NPCTradeCompleteText4::
	text "Uh? What happened?"
	done

_NPCTradeAfterText4::
	text "Trading is so odd…"

	para "I still have a lot"
	line "to learn about it."
	done

_MomLeavingText1::
	text "Wow, that's a cute"
	line "#MON."

	para "Where did you get"
	line "it?"

	para "…"

	para "So, you're leaving"
	line "on an adventure…"

	para "OK!"
	line "I'll help too."

	para "But what can I do"
	line "for you?"

	para "I know! I'll save"
	line "money for you."

	para "On a long journey,"
	line "money's important."

	para "Do you want me to"
	line "save your money?"
	done

_MomLeavingText2::
	text "OK, I'll take care"
	line "of your money."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Be careful."

	para "#MON are your"
	line "friends. You need"
	cont "to work as a team."

	para "Now, go on!"
	done

_MomIsThisAboutYourMoneyText::
	text "Hi! Welcome home!"
	line "You're trying very"
	cont "hard, I see."

	para "I've kept your"
	line "room tidy."

	para "Or is this about"
	line "your money?"
	done

_MomBankWhatDoYouWantToDoText::
	text "What do you want"
	line "to do?"
	done

_MomStoreMoneyText::
	text "How much do you"
	line "want to save?"
	done

_MomTakeMoneyText::
	text "How much do you"
	line "want to take?"
	done

_MomSaveMoneyText::
	text "Do you want to"
	line "save some money?"
	done

_MomHaventSavedThatMuchText::
	text "You haven't saved"
	line "that much."
	prompt

_MomNotEnoughRoomInWalletText::
	text "You can't take"
	line "that much."
	prompt

_MomInsufficientFundsInWalletText::
	text "You don't have"
	line "that much."
	prompt

_MomNotEnoughRoomInBankText::
	text "You can't save"
	line "that much."
	prompt

_MomStartSavingMoneyText::
	text "OK, I'll save your"
	line "money. Trust me!"

	para "<PLAYER>, stick"
	line "with it!"
	done

_MomStoredMoneyText::
	text "Your money's safe"
	line "here! Get going!"
	done

_MomTakenMoneyText::
	text "<PLAYER>, don't"
	line "give up!"
	done

_MomJustDoWhatYouCanText::
	text "Just do what"
	line "you can."
	done
