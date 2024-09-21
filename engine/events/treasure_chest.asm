TreasureChestScript::
	reanchormap
	callasm OpenChestBlockSwap
	refreshmap
	; play sound effects
	; open chest
	; jingle
	callasm TreasureItemAnim
	; open textbox
	; you got ITEM
	; wait
	; sprite disappear
	end

OpenChestBlockSwap:
	call GetFacingTileCoord
	call GetBlockLocation
	ld a, [wTreasureChestOpenBlock]
	ld [hl], a
	call BufferScreen
	ret

TreasureItemAnim:
	call DelayFrame
	ld a, [wStateFlags]
	push af
	xor a
	ld [wStateFlags], a

	call TreasureItem_InitGFX
	farcall LoadItemIconPalette
	farcall SetDefaultBGPAndOBP

	depixel 8, 9, -4, 4
	ld a, SPRITE_ANIM_OBJ_TREASUREITEM
	call InitSpriteAnimStruct

	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $ba

	;ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	;add hl, bc
	;ld [hl], SPRITE_ANIM_FUNC_TREASUREITEM
	ld a, 8
	ld [wFrameCounter], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	ld a, 0 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	callfar DoNextFrameForAllSprites
	call TreasureItem_FrameTimer
	call DelayFrame
	jr .loop

.exit
	pop af
	ld [wStateFlags], a
	ret

TreasureItem_InitGFX:
	ld a, [wTreasureChestItemID] 
	ld hl, ItemIconPointers 
	call SetupLoadItemIcon
	ld hl, vTiles0 tile $ba
	ld b, BANK(NoItemIcon)
	ld c, 2
	call Request2bpp
	xor a
	ld [wJumptableIndex], a
	ret

TreasureItem_FrameTimer:
	ld hl, wFrameCounter
	ld a, [hl]
	and a
	jr z, .exit
	dec [hl]
	cp $40
	ret c
	and $7
	ret nz
	ld de, SFX_FLY
	call PlaySFX
	ret

.exit
	ld b, b
	ld hl, wJumptableIndex
	set 7, [hl]
	farcall ClearSpriteAnims
	ld hl, wShadowOAMSprite36
	ld bc, wShadowOAMEnd - wShadowOAMSprite36
	xor a
	call ByteFill
	call UpdatePlayerSprite
	ret

SetupLoadItemIcon:
	ld c, a     
	ld b, 0     
	add hl, bc  
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l
	ld c, 9
	ret	

INCLUDE "data/items/icon_pointers.asm"