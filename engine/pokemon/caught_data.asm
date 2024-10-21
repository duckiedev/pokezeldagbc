GiveANickname_YesNo:
	ld hl, CaughtAskNicknameText
	call PrintText
	jmp YesNoBox

CaughtAskNicknameText:
	text_far _CaughtAskNicknameText
	text_end

SetCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLevel
	call GetPartyLocation
SetBoxmonCaughtData:
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	ld b, a
	ld a, [wCurPartyLevel]
	or b
	ld [hli], a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokecenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokecenter2F

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a

.NotPokecenter2F:
	call GetWorldMapLocation
	ld b, a
	ld a, [wPlayerGender]
	rrca ; shift bit 0 (PLAYERGENDER_FEMALE_F) to bit 7 (CAUGHT_GENDER_MASK)
	or b
	ld [hl], a
	ret

SetBoxMonCaughtData:
	ld a, BANK(sBoxMon1CaughtLevel)
	call OpenSRAM
	ld hl, sBoxMon1CaughtLevel
	call SetBoxmonCaughtData
	call CloseSRAM
	ret

SetGiftBoxMonCaughtData:
	push bc
	ld a, BANK(sBoxMon1CaughtLevel)
	call OpenSRAM
	ld hl, sBoxMon1CaughtLevel
	pop bc
	call SetGiftMonCaughtData
	call CloseSRAM
	ret

SetGiftPartyMonCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLevel
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData:
	xor a
	ld [hli], a
	ld a, LANDMARK_GIFT
	rrc b
	or b
	ld [hl], a
	ret
