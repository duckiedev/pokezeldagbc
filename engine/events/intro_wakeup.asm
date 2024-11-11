InitWakeup:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a

	ld a, FALSE
	ld [wSpriteUpdatesEnabled], a
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	ld c, 31
	call FadeToBlack
	call ClearTilemap
	call ClearSprites
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	xor a
	ldh [hBGMapMode], a
	call LoadStandardFont
	ld de, TimeSetBackgroundGFX
	ld hl, vTiles2 tile $00
	lb bc, BANK(TimeSetBackgroundGFX), 1
	call Request1bpp
	call .ClearScreen
	call WaitBGMap
	call SetDefaultBGPAndOBP
	ld hl, MomWakeUpText
    ld b, b
	call PrintText
	call WaitPressAorB_BlinkCursor
	pop af
	ldh [hInMenu], a
	ret

.ClearScreen:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ld a, $1
	ldh [hBGMapMode], a
	ret

MomWakeUpText:
    text "<……><……><……><……><……><……>"
    line "<……><……><……><……><……><……>"

    para "???: Wake…<……>"
    line "…up!"

    para "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "MOM: Did you hear"
	line "me?<……><……><……>"

    para "PROF.ELM just"
	line "called and asked"
    cont "if you've checked"
	cont "your email!"

	para "Get up and see"
	line "what he sent ASAP!"
    done
