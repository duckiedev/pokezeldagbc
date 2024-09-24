DefaultOptions:
; wOptions: med text speed
	db TEXT_DELAY_MED | (1 << ASKNICKNAME) | (1 << STEREO)
; wSaveFileExists: no
	db FALSE
; Unused option
	db $00
; wTextboxFlags: use text speed
	db 1 << FAST_TEXT_DELAY_F
; wOptions2: menu account on
	db 1 << MENU_ACCOUNT

	db $00
	db $00
	db $00
.End
	assert DefaultOptions.End - DefaultOptions == wOptionsEnd - wOptions
