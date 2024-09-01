DerekPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	farscall PhoneScript_AnswerPhone_Male
	farsjump DerekHangUpScript

.Nugget:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump DerekComePickUpScript

DerekPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	farscall PhoneScript_Random4

.Nugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_39
	farsjump PhoneScript_FoundItem_Male
