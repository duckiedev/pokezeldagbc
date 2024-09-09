_AnimateEXPBar:
    call .ComputePixels
.AnimLoop:
    push bc
    push hl
    call EXPAnim_UpdateVariables
    pop hl
    pop bc
    push af
    push bc
    push hl
    call EXPBarAnim_UpdateTiles
    call EXPBarAnim_BGMapUpdate
    pop hl
    pop bc
    pop af
    jr nc, .AnimLoop
    ret

.ComputePixels:
    push hl
    ld hl, wCurEXPAnimMaxEXP
    ld a, [hli]
    ld e, a
    ld a, [hli]
    ld d, a
    ld a, [hli]
    ld c, a
    ld a, [hli]
    ld b, a
    pop hl
    call ComputeEXPBarPixels
    ld a, e
    ld [wCurEXPBarPixels], a

    ld a, [wCurEXPAnimNewEXP]
    ld c, a
    ld a, [wCurEXPAnimNewEXP + 1]
    ld b, a
    ld a, [wCurEXPAnimMaxEXP]
    ld e, a
    ld a, [wCurEXPAnimMaxEXP + 1]
    ld d, a
    call ComputeEXPBarPixels
    ld a, e
    ld [wNewEXPBarPixels], a

    push hl
    ld hl, wCurEXPAnimOldEXP
    ld a, [hli]
    ld c, a
    ld a, [hli]
    ld b, a
    ld a, [hli]
    ld e, a
    ld a, [hli]
    ld d, a
    pop hl
    ; Always increment up
    ld a, [wCurEXPAnimOldEXP]
    ld [wCurEXPAnimLowEXP], a
    ld a, [wCurEXPAnimNewEXP]
    ld [wCurEXPAnimHighEXP], a
    ld bc, 1
    ld a, d
    ld [wCurEXPAnimDeltaEXP], a
    ld a, e
    ld [wCurEXPAnimDeltaEXP + 1], a
    ret

EXPAnim_UpdateVariables:
    ld hl, wCurEXPBarPixels
    ld a, [wNewEXPBarPixels]
    cp [hl]
    jr nz, .not_finished
    scf
    ret

.not_finished
    ld a, c
    add [hl]
    ld [hl], a
    call EXPBar_CalcPixelFrame
    and a
    ret

EXPBarAnim_UpdateTiles:
    ld a, [wCurEXPBarPixels]
    ld e, a
    ld c, a
    push de
    call EXPBarAnim_RedrawEXPBar
    pop de
    ret

EXPBarAnim_RedrawEXPBar:
    predef DrawBattleEXPBar
    ret

EXPBarAnim_BGMapUpdate:
    ld c, $0
    push af
    ld a, $2
    ldh [hBGMapMode], a
    ld a, c
    ldh [hBGMapThird], a
    call DelayFrame
    ld a, $1
    ldh [hBGMapMode], a
    ld a, c
    ldh [hBGMapThird], a
    call DelayFrame
    pop af
    ret

EXPBar_CalcPixelFrame:
    ld a, [wCurEXPAnimMaxEXP]
    ld c, a
    ld b, 0
    ld hl, 0
    ld a, [wCurEXPBarPixels]
    cp EXP_BAR_LENGTH_PX
    jr nc, .return_max
    and a
    jr z, .return_zero
    call AddNTimes

    ld b, 0
.loop
    ld a, l
    sub EXP_BAR_LENGTH_PX
    ld l, a
    ld a, h
    sbc $0
    ld h, a
    jr z, .done
    jr c, .done
    inc b
    jr .loop

.done
    push bc
    ld bc, $30
    add hl, bc
    pop bc
    ld a, l
    sub EXP_BAR_LENGTH_PX
    ld l, a
    ld a, h
    sbc $0
    ld h, a
    jr c, .no_carry
    inc b
.no_carry
    ld a, [wCurEXPAnimLowEXP]
    cp b
    jr nc, .finish
    ld a, [wCurEXPAnimHighEXP]
    cp b
    jr c, .finish
    ld a, b
.finish
    ld [wCurEXPAnimOldEXP], a
    ret

.return_zero
    xor a
    ld [wCurEXPAnimOldEXP], a
    ret

.return_max
    ld a, [wCurEXPAnimMaxEXP]
    ld [wCurEXPAnimOldEXP], a
    ret