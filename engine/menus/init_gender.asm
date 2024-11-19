InitCrystalData:
	xor a
	ld [wPlayerGender], a
	ret

InitGender:
	jr InitCrystalData
