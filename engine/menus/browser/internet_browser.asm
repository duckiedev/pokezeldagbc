DEF BUTTON_NEXT EQU $0
DEF BUTTON_MALE  EQU $1
DEF BUTTON_FEMALE EQU $2
DEF BUTTON_NAME EQU $3

_InternetBrowser::
	ld a, $1
	ldh [hInMenu], a
	; Initialize browser state
	xor a
	ld [wBrowserPageIndex], a ; first page
	jmp BrowserJumptable

LoadPagePrep:
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	callfar ClearSpriteAnims
	call DisableLCD

	call .LoadTiles
	call .LoadPals
	call .LoadTilemap
	call .LoadAttrmap
	hlbgcoord 0, 0
	call Function16cc73

	xor a
	ldh [hBGMapMode], a
	ret

.LoadTiles:
	ld hl, vTiles2
	ld de, BrowserTiles
	lb bc, BANK(BrowserTiles), $67
	jmp Get2bpp

.LoadPals:
	ld b, SCGB_BROWSER
	call GetSGBLayout
	jmp SetDefaultBGPAndOBP

.LoadTilemap:
	ld hl, BrowserAvatarTilemap
	ld a, [wBrowserPageIndex]
	cp 4 ; BrowserPage8
	jr z, .continue
	ld hl, BrowserTilemap
.continue
	decoord 0, 0
	ld bc, $0360
	jmp CopyBytes

.LoadAttrmap:
	ld hl, BrowserAttrmap
	decoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	jmp CopyBytes

LoadPageEnd:
	call EnableLCD
	call WaitBGMap2
; fallthrough
InputLoop:
	farcall PlaySpriteAnimationsAndDelayFrame
	call JoyTextDelay
	ld a, [wBrowserPageIndex]
	bit 7, a
	jr nz, .exit
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and START
	jr nz, .start
	ld a, [wBrowserPageIndex]
	cp 4
	jr nz, InputLoop
.check_left_right
	; only check for left and right if on profile page
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	jr InputLoop

.exit
	jmp ClearBGPalettes

.start
.a
	ld a, [wBrowserPageIndex]
	cp 4
	jp z, ProfileSelectionInputs
	jr ButtonNextPage

.b
	ld a, [wBrowserPageIndex]
	cp 0
	jr z, InputLoop
	
	ld hl, wBrowserPageIndex
	dec [hl]
	jmp BrowserJumptable

.left
	ld a, [wBrowserButtonSelected]
	cp BUTTON_MALE
	jr z, .select_next
	ld a, [wBrowserButtonSelected]
	cp BUTTON_NEXT
	jr z, .select_female
	ld a, [wBrowserButtonSelected]
	cp BUTTON_FEMALE
	jr z, .select_male
	ret

.right
	ld a, [wBrowserButtonSelected]
	cp BUTTON_MALE
	jr z, .select_female
	ld a, [wBrowserButtonSelected]
	cp BUTTON_FEMALE
	jr z, .select_next
	ld a, [wBrowserButtonSelected]
	cp BUTTON_NEXT
	jr z, .select_male
	ret

.select_male
	call MoveToMale
	jmp InputLoop

.select_female
	call MoveToFemale
	jmp InputLoop

.select_next
	call MoveToNext
	jmp InputLoop

.end
	ld hl, wBrowserPageIndex
	set 7, [hl]
	ret

ButtonNextPage:
	ld hl, wBrowserPageIndex
	inc [hl]
	jmp BrowserJumptable

CursorOnNext:
	hlcoord 13, 15
	ld a, $66
	ld [hl], a
	ret

CursorOffNext:
	hlcoord 13, 15
	ld a, $27
	ld [hl], a
	ret

CursorOnFemale:
	hlcoord 8, 15
	ld a, $37
	ld [hl], a
	ret

CursorOffFemale:
	hlcoord 8, 15
	ld a, $22
	ld [hl], a
	ret

CursorOnMale:
	hlcoord 3, 15
	ld a, $37
	ld [hl], a
	ret

CursorOffMale:
	hlcoord 3, 15
	ld a, $22
	ld [hl], a
	ret

MoveToNext:
	ld a, BUTTON_NEXT
	ld [wBrowserButtonSelected], a
	; Male Off
	call CursorOffMale
	; Female Off
	call CursorOffFemale
	; Next On
	jr CursorOnNext

MoveToMale:
	ld a, BUTTON_MALE
	ld [wBrowserButtonSelected], a
	; Male On
	call CursorOnMale
	; Female Off
	call CursorOffFemale
	; Next Off
	jr CursorOffNext

MoveToFemale:
	ld a, BUTTON_FEMALE
	ld [wBrowserButtonSelected], a
	; Male Off
	call CursorOffMale
	; Female On
	call CursorOnFemale
	; Next Off
	jr CursorOffNext

ProfileSelectionInputs:
	ld a, [wBrowserButtonSelected]
	cp BUTTON_NEXT
	jr z, .next
	ld a, [wBrowserButtonSelected]
	cp BUTTON_MALE
	jr z, .male
	ld hl, wPlayerGender
	set PLAYERGENDER_FEMALE_F, [hl]
	jr .end

.next
	jr ButtonNextPage
.male
	farcall InitGender
.end
	call GenderSwitch
	call WaitBGMap2
	jmp InputLoop

Function16cc73:
	ldh a, [rVBK]
	push af
	ld a, $0
	ldh [rVBK], a
	push hl
	decoord 0, 0
	call Function16cc90
	pop hl
	ld a, $1
	ldh [rVBK], a
	decoord 0, 0, wAttrmap
	call Function16cc90
	pop af
	ldh [rVBK], a
	ret

Function16cc90:
	ld bc, $1214
.asm_16cc93
	push bc
.asm_16cc94
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_16cc94
	ld bc, $000c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_16cc93
	ret

BrowserJumptable:
	jumptable .Jumptable, wBrowserPageIndex

.Jumptable:
	dw BrowserPage1 ; 0
	dw BrowserPage2 ; 1
	dw BrowserPage3 ; 2
	dw BrowserPage4 ; 3
	dw BrowserPage5 ; 4
	dw BrowserPage6 ; 5
	dw BrowserPage7 ; 6

BrowserPage1:
	call LoadPagePrep
	call DrawNextButton
	call CursorOnNext
	ld de, .Text
	call DrawMessage
	jmp LoadPageEnd
.Text:
	db "Congratulations!"
	next1 "You've been invited"
	next1 "to the official"
	next1 "<PKMN> Champion's"
	next1 "Summit as the"
	next1 "representative of"
	next1 "the Johto region!"
	db "@"

BrowserPage2:
	call LoadPagePrep
	ld de, .Text
	call DrawMessage
	call DrawNextButton
	call CursorOnNext
	jmp LoadPageEnd
.Text:
	db 		"PROF.ELM has spon-"
	next1 	"sored your round-"
	next1 	"trip flight and"
	next1 	"accommodations to"
	next1 	"the Sinnoh region."
	db "@"

BrowserPage3:
	call LoadPagePrep
	ld de, .Text
	call DrawMessage
	call DrawNextButton
	call CursorOnNext
	jmp LoadPageEnd
.Text:
	db 		"Once there, you'll"
	next1 	"join the champions"
	next1 	"from all over the"
	next1 	"world at SPEAR"
	next1 	"PILLAR, located at"
	next1 	"the peak of MT."
	next1 	"CORONET to discuss"
	next1 	"the future of <PKMN>"
	next1 	"training!"
	db "@"

BrowserPage4:
	call LoadPagePrep
	ld de, .Text
	call DrawMessage
	call DrawNextButton
	call CursorOnNext
	jmp LoadPageEnd
.Text:
	db 		"Please register"
	next1 	"your profile to"
	next1 	"reserve your spot"
	next1 	"and verify you've"
	next1 	"received this"
	next1 	"information."
	db "@"

BrowserPage5:
	call LoadPagePrep
	farcall InitGender
	call GenderSwitch
	ld de, .Text
	call DrawMessage
	call DrawNextButton
	call MoveToMale
	jmp LoadPageEnd
.Text:
	db "First, choose your"
	next1 "profile avatar."
	db "@"

BrowserPage6:
	call LoadPagePrep
	ld de, .Text
	call DrawMessage
	call DrawNextButton
	call CursorOnNext
	jmp LoadPageEnd
.Text:
	db 		"Thank you!"
	next1   "Please verify your"
	next1 	"name."
	db "@"

BrowserPage7:
	call DoNamingScreen
	call LoadPagePrep
	ld de, .Text
	call DrawMessage
	ld de, Done
	hlcoord 14, 15
	call PlaceString
	call CursorOnNext
	jmp LoadPageEnd
.Text:
	db 		"Thank you <PLAYER>!"
	next1   "Your tickets have"
	next1 	"been e-mailed to"
	next1   "your sponsor,"
	next1
	next1 	"PROF.ELM."
	next1
	next1   "We hope to see you"
	next1   "soon!"
	db "@"
Next:
	db "Next@"
Done:
	db "Done@"

DoNamingScreen:
	ld b, NAME_PLAYER
	ld de, wPlayerName
	farcall NamingScreen

	ld c, 15
	call FadeToWhite
	call ClearTilemap

	call WaitBGMap

	ld hl, wPlayerName
	ld de, .Chris
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .Male
	ld de, .Kris
.Male:
    jmp InitName

.Chris:
	db "CHRIS@@@@@@"
.Kris:
	db "KRIS@@@@@@@"

DrawMessage:
	hlcoord 2, 6
	jmp PlaceString

DrawNextButton:
	ld de, Next
	hlcoord 14, 15
	jmp PlaceString

LoadPlayerGFX:
	call ClearSprites
	callfar ClearSpriteAnims
	farcall GetPlayerIcon
	push de
	ld hl, vTiles0
	ld c, 4
	push bc
	call Request2bpp
	pop bc
	ld hl, 12 tiles
	add hl, de
	ld e, l
	ld d, h
	ld hl, vTiles0 tile $04
	call Request2bpp
	xor a ; SPRITE_ANIM_DICT_DEFAULT and tile offset $00
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], a
	pop de
	ld b, SPRITE_ANIM_OBJ_RED_WALK
	ld a, d
	cp HIGH(KrisSpriteGFX)
	jr nz, .not_kris
	ld a, e
	cp LOW(KrisSpriteGFX)
	jr nz, .not_kris
	ld b, SPRITE_ANIM_OBJ_BLUE_WALK
.not_kris
	ld a, b
	depixel 15, 17, 0, 0
	jmp InitSpriteAnimStruct

GenderSwitch:
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .Chris
; Kris.
	; Chris Button Toggle Off
	hlcoord 4, 15
	ld a, $2e
	ld [hl], a

	hlcoord 4, 15, wAttrmap
	ld a, $0
	ld [hl], a

	; Kris Button Toggle On
	hlcoord 9, 15
	ld a, $2f
	ld [hl], a

	hlcoord 9, 15, wAttrmap
	ld a, $2
	ld [hl], a

	; Kris Palette On
	hlcoord 8, 8, wAttrmap
	lb bc, 7, 4
	ld a, $5
	call PaletteFillBox

	; Chris Palette Off
	hlcoord 2, 8, wAttrmap
	lb bc, 7, 5
	ld a, $0
	call PaletteFillBox
	jr .end

.Chris
	; Kris Button Toggle Off
	hlcoord 9, 15
	ld a, $2e
	ld [hl], a

	hlcoord 9, 15, wAttrmap
	ld a, $0
	ld [hl], a

	; Chris Button Toggle On
	hlcoord 4, 15
	ld a, $2f
	ld [hl], a

	hlcoord 4, 15, wAttrmap
	ld a, $2
	ld [hl], a

	; Chris Palette On
	hlcoord 2, 8, wAttrmap
	lb bc, 7, 5
	ld a, $6
	call PaletteFillBox

	; Kris Palette Off
	hlcoord 8, 8, wAttrmap
	lb bc, 7, 4
	ld a, $0
	call PaletteFillBox
.end
	jmp LoadPlayerGFX

PaletteFillBox:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

BrowserTiles:
INCBIN "gfx/browser/browser.2bpp"

BrowserTilemap:
INCBIN "gfx/browser/browser.tilemap"

BrowserAttrmap:
INCBIN "gfx/browser/browser.attrmap"

BrowserAvatarTilemap:
INCBIN "gfx/browser/browser_avatar.tilemap"
