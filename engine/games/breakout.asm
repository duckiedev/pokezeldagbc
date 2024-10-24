; TODO: Port over https://github.com/blakesmith/brickbasher
/*
; Constants
DEF PLAYFIELD_X_START EQU 14
DEF PLAYFIELD_X_END EQU 108
DEF PLAYFIELD_X_MIDDLE EQU 60

DEF PLAYFIELD_Y_TOP EQU 24
DEF PLAYFIELD_Y_BOTTOM EQU 148
DEF PLAYFIELD_Y_MIDDLE EQU 80

;; Brick x, y position constants
DEF PADDING_TILE_LEFT EQU 1
DEF PADDING_TILE_TOP EQU 3
DEF TILES_PER_BRICK EQU 2
DEF PIXELS_PER_TILE EQU 8

DEF PADDLE_Y EQU 128 + 16

;; The pixel distance from the right or left of the paddle
;; where we'd 'accelerate' the X velocity of the ball, because it
;; hit the edge of the paddle.
DEF PADDLE_EDGE_DISTANCE EQU 5

DEF BRICKS_START EQU 33
DEF BRICKS_PER_LINE EQU 6
DEF MAX_BRICK_LINES EQU 5

;; How many lives do we get before game over.
DEF LIVES_PER_GAME EQU 5

;; Tile mappings

DEF WHITE_TILE EQU $04
DEF BLACK_TILE EQU $1E
DEF LIGHT_GRAY_TILE EQU $08
DEF DARK_GRAY_TILE EQU $09		; BORDER_SIDE_TILE
DEF BRICK_LEFT_TILE EQU $00
DEF BRICK_RIGHT_TILE EQU $01
DEF BRICK_LEFT_DAMAGED EQU $0C
DEF BRICK_RIGHT_DAMAGED EQU $0D

;; Lives tiles
DEF LIVES_TILEMAP_POS EQU 499
DEF LIVES_TILE_START EQU $10

;; Level data
DEF LEVEL_SIZE EQU 30

;; Ball data
DEF BALL_MOVE_RIGHT EQU 1 << 1
DEF BALL_MOVE_UP    EQU 1 << 2

; Macros
MACRO BounceBallLeft
	ld a, [wBallMoveState]
	xor a, BALL_MOVE_RIGHT
	ld [wBallMoveState], a
ENDM

MACRO BounceBallRight
	ld a, [wBallMoveState]
	or a, BALL_MOVE_RIGHT
	ld [wBallMoveState], a
ENDM

MACRO BounceBallDown
	ld a, [wBallMoveState]
	xor a, BALL_MOVE_UP
	ld [wBallMoveState], a
ENDM

MACRO BounceBallUp
	ld a, [wBallMoveState]
	or a, BALL_MOVE_UP
	ld [wBallMoveState], a
ENDM

;; This is a macro to prevent stack pushes on each new game
MACRO CheckGameState
        ;; Check to see if the ball died
        ld a, [wBallDead]
        ld b, 1
        cp a, b
        jmp z, BallDead

        ld a, [wLevelClear]
        ld b, 1
        cp a, b
        jmp z, NextLevel
ENDM
*/

_BreakoutGame:
	ret
/*
	call DelayFrame	; WaitVBlank
    call DisableLCD
	call InitGFXData
	call InitOAM

	; Start the ball moving
	ld a, 1
	ld [wBallMomentumX], a
	ld a, -1
	ld [wBallMomentumY], a

    ; Reset some things
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	ldh [rWY], a
	ld a, $1
	ldh [hBGMapMode], a

    ; Turn the LCD on
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a

    ; During the first (blank) frame, initlaize the palettes?
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call DmgToCgbObjPal0

	; Initialize global variables
	call ResetFrameCounter

InitGFXData:
    ; Palette Data
	ld b, SCGB_DIPLOMA
	call GetSGBLayout

    ; Copy the tile data
	ld de, vTiles2 tile $00
	ld hl, BreakoutGameLZ
	call Decompress

    ; Copy BG Tilemap
    decoord 0, 0
	ld hl, BreakoutGameTilemap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call CopyBytes

    ; Copy the paddle
	ld de, vTiles0 tile $00
    ld hl, BreakoutPaddleGFX
	ld bc, $10
    call CopyBytes

	; Copy the ball
	ld de, vTiles0 tile $01
	ld hl, BreakoutBallGFX
	ld bc, $10
    jmp CopyBytes

InitOAM:
    ; Initialize Paddle sprite
    ld hl, wShadowOAMSprite00
    ld a, 128 + 16  ; y pos
    ld [hli], a
    ld a, 16 + 8    ; x pos
    ld [hli], a
    ld a, 0         ; tile id + attributes
    ld [hli], a     
    ld [hli], a

	; Initialize Ball sprite
	ld hl, wShadowOAMSprite01
    ld a, 100 + 16  ; y pos
    ld [hli], a
    ld a, 16 + 8    ; x pos
    ld [hli], a
    ld a, $1        ; tile id + attributes
    ld [hli], a  
	xor a   
    ld [hli], a
	ret

Main:
	call DelayFrame

UpdateBallMomentum:
	; Add the ball's momentum to its position in OAM
	ld a, [wBallMomentumX]
	ld b, a
	ld a, [wShadowOAMSprite01XCoord]
	add a, b
	ld [wShadowOAMSprite01XCoord], a

	ld a, [wBallMomentumY]
	ld b, a
	ld a, [wShadowOAMSprite01YCoord]
	add a, b
	ld [wShadowOAMSprite01YCoord], a

BounceOnTop:
	; Remember to offset the OAM position!
	; (8, 16) in OAM coordinates is (0, 0) on the screen.
	ld a, [wShadowOAMSprite01YCoord]
	sub a, 17
	ld c, a
	ld a, [wShadowOAMSprite01XCoord]
	add a, 4
	ld b, a
	call GetTileByPixel ; Returns tile address in hl
	ld a, [hl]
	call IsWallTile
 	jmp nz, BounceOnRight
	ld a, 1
	ld [wBallMomentumY], a

BounceOnRight:
	ld a, [wShadowOAMSprite01YCoord]
	sub a, 8 + 4
	ld c, a
	ld a, [wShadowOAMSprite01XCoord]
	sub a, 8
	inc a
	ld b, a
	call GetTileByPixel
	ld a, [hl]
	call IsWallTile
 	jmp nz, BounceOnLeft
	ld a, -1
	ld [wBallMomentumX], a

BounceOnLeft:
	ld a, [wShadowOAMSprite01YCoord]
	sub a, 8 + 4
	ld c, a
	ld a, [wShadowOAMSprite01XCoord]
	sub a, 8 + 1
	ld b, a
	call GetTileByPixel
	ld a, [hl]
	call IsWallTile
 	jmp nz, BounceOnBottom
	ld a, 1
	ld [wBallMomentumX], a

BounceOnBottom:
	ld a, [wShadowOAMSprite01YCoord]
	sub a, 7
	ld c, a
	ld a, [wShadowOAMSprite01XCoord]
	add a, 4
	ld b, a
	call GetTileByPixel
	ld a, [hl]
	call IsWallTile
 	jmp nz, BounceDone
	ld a, -1
	ld [wBallMomentumY], a
BounceDone:
    ; First, check if the ball is low enough to bounce off the paddle.
    ld a, [wShadowOAMSprite00YCoord]
    ld b, a
    ld a, [wShadowOAMSprite01YCoord]
	add a, 6
    cp a, b
    jr nz, PaddleBounceDone ; If the ball isn't at the same Y position as the paddle, it can't bounce.
    ; Now let's compare the X positions of the objects to see if they're touching.
    ld a, [wShadowOAMSprite01XCoord] ; Ball's X position.
    ld b, a
    ld a, [wShadowOAMSprite00XCoord] ; Paddle's X position.
    sub a, 8
    cp a, b
    jr nc, PaddleBounceDone
    add a, 8 + 16 ; 8 to undo, 16 as the width.
    cp a, b
    jr c, PaddleBounceDone

    ld a, -1
    ld [wBallMomentumY], a

PaddleBounceDone:
	; Get input
	call JoyTextDelay
; First check if the left button is pressed
CheckLeft:
	ld a, [hJoyDown]
	and a, D_LEFT
	jr z, CheckRight
Left:
	; Move the paddle one pixel to the left.
	ld a, [wShadowOAMSprite00XCoord]
	dec a
	; If we've already hit the edge of the playfield, don't move.
	cp a, 15
 	jmp z, Main
	ld [wShadowOAMSprite00XCoord], a
 	jmp Main
CheckRight:
	ld a, [hJoyDown]
	and a, D_RIGHT
 	jmp z, Main
Right:
	; Move the paddle one pixel to the right.
	ld a, [wShadowOAMSprite00XCoord]
	inc a
	; If we've already hit the edge of the playfield, don't move.
	cp a, 105
 	jmp z, Main
	ld [wShadowOAMSprite00XCoord], a
 	jmp Main

ResetFrameCounter:
	; Initialize global variables
	xor a
	ld [wFrameCounter], a
	ret

; Convert a pixel position to a tilemap address
; hl = $9800 + X + Y * 32
; @param b: X
; @param c: Y
; @return hl: tile address
GetTileByPixel:
    ; First, we need to divide by 8 to convert a pixel position to a tile position.
    ; After this we want to multiply the Y position by 32.
    ; These operations effectively cancel out so we only need to mask the Y value.
    ld a, c
    and a, %11111000
    ld l, a
    ld h, 0
    ; Now we have the position * 8 in hl
    add hl, hl ; position * 16
    add hl, hl ; position * 32
    ; Convert the X position to an offset.
    ld a, b
    srl a ; a / 2
    srl a ; a / 4
    srl a ; a / 8
    ; Add the two offsets together.
    add a, l
    ld l, a
    adc a, h
    sub a, l
    ld h, a
    ; Add the offset to the tilemap's base address, and we are done!
    ld bc, $9800
    add hl, bc
    ret

; @param a: tile ID
; @return z: set if a is a wall.
IsWallTile:
    cp a, $00
    ret z
    cp a, $01
    ret z
    cp a, $02
    ret z
    cp a, $08
    ret

    ; Initialize the global variable
    ld a, 0
    ld [wFrameCounter3], a

	call .LoadGFXAndPals

    ;jr Main
;.loop
	;call .JumptableLoop
	;jr nc, .loop
	;ret

.LoadGFXAndPals:
    ld a, SPRITE_ANIM_DICT_ARROW_CURSOR
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $00
	ret

.JumptableLoop:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	call .ExecuteJumptable
	callfar PlaySpriteAnimations
	call DelayFrame
	and a
	ret

.quit
	scf
	ret

.ExecuteJumptable:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
    dw .Main
	dw .RestartGame
	dw .ResetBoard
	dw .InitBoardTilemapAndCursorObject
	dw .CheckTriesRemaining
	dw .PickCard1
	dw .PickCard2
	dw .DelayPickAgain
	dw .RevealAll
	dw .AskPlayAgain

.RestartGame:
	call MemoryGame_InitStrings
	ld hl, wJumptableIndex
	inc [hl]
	ret

.ResetBoard:
	call UnusedCursor_InterpretJoypad_AnimateCursor
	jr nc, .proceed
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.proceed
	call MemoryGame_InitBoard
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wMemoryGameCounter], a
	ld hl, wMemoryGameLastMatches
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld [wMemoryGameNumCardsMatched], a
.InitBoardTilemapAndCursorObject:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .spawn_object
	inc [hl]
	call MemoryGame_Card2Coord
	xor a
	ld [wMemoryGameLastCardPicked], a
    jmp MemoryGame_PlaceCard

.spawn_object
	depixel 6, 3, 4, 4
	ld a, SPRITE_ANIM_OBJ_MEMORY_GAME_CURSOR
	call InitSpriteAnimStruct
	ld a, 5
	ld [wMemoryGameNumberTriesRemaining], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.CheckTriesRemaining:
	ld a, [wMemoryGameNumberTriesRemaining]
	hlcoord 17, 0
	add "0"
	ld [hl], a
	ld hl, wMemoryGameNumberTriesRemaining
	ld a, [hl]
	and a
	jr nz, .next_try
	ld a, $7
	ld [wJumptableIndex], a
	ret

.next_try
	dec [hl]
	xor a
	ld [wMemoryGameCardChoice], a
	ld hl, wJumptableIndex
	inc [hl]
.PickCard1:
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard1], a
	ld a, e
	ld [wMemoryGameCard1Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	xor a
	ld [wMemoryGameCardChoice], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

.PickCard2:
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld hl, wMemoryGameCard1Location
	cp [hl]
	ret z
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard2], a
	ld a, e
	ld [wMemoryGameCard2Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	ld a, 64
	ld [wMemoryGameCounter], a
	ld hl, wJumptableIndex
	inc [hl]
.DelayPickAgain:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	and a
	jr z, .PickAgain
	dec [hl]
	ret

.PickAgain:
	call MemoryGame_CheckMatch
	ld a, $3
	ld [wJumptableIndex], a
	ret

.RevealAll:
	ldh a, [hJoypadPressed]
	and A_BUTTON
	ret z
	xor a
	ld [wMemoryGameCounter], a
.RevelationLoop:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .finish_round
	inc [hl]
	push af
	call MemoryGame_Card2Coord
	pop af
	push hl
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	pop hl
	cp -1
	jr z, .RevelationLoop
	ld [wMemoryGameLastCardPicked], a
	call MemoryGame_PlaceCard
	jr .RevelationLoop

.finish_round
	call WaitPressAorB_BlinkCursor
	ld hl, wJumptableIndex
	inc [hl]
.AskPlayAgain:
	call UnusedCursor_InterpretJoypad_AnimateCursor
	jr nc, .restart
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.restart
	xor a
	ld [wJumptableIndex], a
	ret

MemoryGame_CheckMatch:
	ld hl, wMemoryGameCard1
	ld a, [hli]
	cp [hl]
	jr nz, .no_match

	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard

	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard

	ld a, [wMemoryGameCard1Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1

	ld a, [wMemoryGameCard2Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1

	ld hl, wMemoryGameLastMatches
.find_empty_slot
	ld a, [hli]
	and a
	jr nz, .find_empty_slot
	dec hl
	ld a, [wMemoryGameCard1]
	ld [hl], a
	ld [wMemoryGameLastCardPicked], a
	ld hl, wMemoryGameNumCardsMatched
	ld e, [hl]
	inc [hl]
	inc [hl]
	ld d, 0
	hlcoord 5, 0
	add hl, de
	call MemoryGame_PlaceCard
	ld hl, .VictoryText
    jmp PrintText

.no_match
	xor a
	ld [wMemoryGameLastCardPicked], a

	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard

	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard

	ld hl, MemoryGameDarnText
    jmp PrintText

.VictoryText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, MemoryGameYeahText
	pop bc
	inc bc
	inc bc
	inc bc
	ret

MemoryGameYeahText:
	text_far _MemoryGameYeahText
	text_end

MemoryGameDarnText:
	text_far _MemoryGameDarnText
	text_end

MemoryGame_InitBoard:
	ld hl, wMemoryGameCards
	ld bc, wMemoryGameCardsEnd - wMemoryGameCards
	xor a
	call ByteFill
	call MemoryGame_GetDistributionOfTiles

	ld c, 2
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 8
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 4
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 7
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 3
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 6
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 1
	ld b, [hl]
	call MemoryGame_SampleTilePlacement

	ld c, 5
	ld hl, wMemoryGameCards
	ld b, wMemoryGameCardsEnd - wMemoryGameCards
.loop
	ld a, [hl]
	and a
	jr nz, .no_load
	ld [hl], c
.no_load
	inc hl
	dec b
	jr nz, .loop
	ret

MemoryGame_SampleTilePlacement:
	push hl
	ld de, wMemoryGameCards
.loop
	call Random
	and %00111111
	cp 45
	jr nc, .loop
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld [hl], c
	dec b
	jr nz, .loop
	pop hl
	inc hl
	ret

MemoryGame_GetDistributionOfTiles:
	ld a, [wMenuCursorY]
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .distributions
	add hl, de
	ret

.distributions
	db $02, $03, $06, $06, $06, $08, $08, $06
	db $02, $02, $04, $06, $06, $08, $08, $09
	db $02, $02, $02, $04, $07, $08, $08, $0c

MemoryGame_PlaceCard:
	ld a, [wMemoryGameLastCardPicked]
	sla a
	sla a
	add 4
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	inc a
	ld [hl], a
	ld c, 3
    jmp DelayFrames

MemoryGame_DeleteCard:
	ld a, $1
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld c, 3
    jmp DelayFrames

MemoryGame_InitStrings:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $1
	call ByteFill
	hlcoord 0, 0
	ld de, .str1
	call PlaceString
	hlcoord 15, 0
	ld de, .str2
	call PlaceString
	ld hl, .dummy_text
    jmp PrintText

.dummy_text
	db "@"
.str1
	db "BREAKOUT"
.str2
	db "CLONE!"

MemoryGame_Card2Coord:
	ld d, 0
.find_row
	sub 9
	jr c, .found_row
	inc d
	jr .find_row

.found_row
	add 9
	ld e, a
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
.loop2
	ld a, d
	and a
	jr z, .done
	add hl, bc
	dec d
	jr .loop2

.done
	sla e
	add hl, de
	ret

MemoryGame_InterpretJoypad_AnimateCursor:
	ld a, [wJumptableIndex]
	cp $7
	jr nc, .quit
	call JoyTextDelay
	ld hl, hJoypadPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressed_a
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	ld a, [hl]
	and D_RIGHT
	jr nz, .pressed_right
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up
	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
	ret

.quit
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.pressed_a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a
	ld [wMemoryGameCardChoice], a
	ret

.pressed_left
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	dec [hl]
	ret

.pressed_right
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp (9 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	ret

.pressed_up
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub 9
	ld [hl], a
	ret

.pressed_down
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp (5 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add 9
	ld [hl], a
	ret
*/

BreakoutGameLZ::
    INCBIN "gfx/breakout/breakout.2bpp.lz"
BreakoutGameTilemap:
    INCBIN "gfx/breakout/breakout.tilemap"
BreakoutPaddleGFX:
    INCBIN "gfx/breakout/paddle.2bpp"
BreakoutBallGFX:
	INCBIN "gfx/breakout/ball.2bpp"
BreakoutGameGFX:
    ret