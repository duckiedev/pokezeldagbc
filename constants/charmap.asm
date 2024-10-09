; $00-$16 are TX_* constants (see macros/scripts/text.asm)

; Control characters (see home/text.asm)

	charmap "<NULL>",    $00
	charmap "<PLAY_G>",  $14 ; "<PLAYER>くん" or "<PLAYER>ちゃん"; same as "<PLAYER>" in English
	charmap "<CR>",      $16
	charmap "<BSP>",     $1f ; breakable space (usually " ", or "<LF>" on the Town Map)
	charmap "<LF>",      $22
	charmap "<POKE>",    $24 ; "<PO><KE>"
	charmap "<WBR>",     $25 ; word-break opportunity (usually skipped, or "<LF>" on the Town Map)
	charmap "<RED>",     $38 ; wRedsName
	charmap "<GREEN>",   $39 ; wGreensName
	charmap "<ENEMY>",   $3f
	charmap "<MOM>",     $49 ; wMomsName
	charmap "<PKMN>",    $4a ; "<PK><MN>"
	charmap "<_CONT>",   $4b ; implements "<CONT>"
	charmap "<SCROLL>",  $4c
	charmap "<NEXT>",    $4e
	charmap "<LINE>",    $4f
	charmap "@",         $50 ; string terminator
	charmap "<PARA>",    $51
	charmap "<PLAYER>",  $52 ; wPlayerName
	charmap "<RIVAL>",   $53 ; wRivalName
	charmap "#",         $54 ; "POKé"
	charmap "<CONT>",    $55
	charmap "<……>",      $56 ; "……"
	charmap "<DONE>",    $57
	charmap "<PROMPT>",  $58
	charmap "<TARGET>",  $59
	charmap "<USER>",    $5a
	charmap "<PC>",      $5b ; "PC"
	charmap "<TM>",      $5c ; "TM"
	charmap "<TRAINER>", $5d ; "TRAINER"
	charmap "<ROCKET>",  $5e ; "ROCKET"
	charmap "<DEXEND>",  $5f

; Actual characters (from gfx/font/font_battle_extra.png)

	charmap "<LV>",      $6e
	charmap "<BOSS>",    $70
	charmap "◀",         $71
	charmap "<ID>",      $73
	charmap "№",         $74

; Actual characters (from other graphics files)

	charmap " ",		 $7f ;

	; needed for StatsScreen_PlaceShinyIcon and PrintPartyMonPage1
	charmap "⁂",         $3f ; gfx/stats/stats_tiles.png, tile 14

; Actual characters (from gfx/font/font.png)

	charmap "A",         $80
	charmap "B",         $81
	charmap "C",         $82
	charmap "D",         $83
	charmap "E",         $84
	charmap "F",         $85
	charmap "G",         $86
	charmap "H",         $87
	charmap "I",         $88
	charmap "J",         $89
	charmap "K",         $8a
	charmap "L",         $8b
	charmap "M",         $8c
	charmap "N",         $8d
	charmap "O",         $8e
	charmap "P",         $8f
	charmap "Q",         $90
	charmap "R",         $91
	charmap "S",         $92
	charmap "T",         $93
	charmap "U",         $94
	charmap "V",         $95
	charmap "W",         $96
	charmap "X",         $97
	charmap "Y",         $98
	charmap "Z",         $99

	charmap "(",         $9a
	charmap ")",         $9b
	charmap ":",         $9c
	charmap ";",         $9d
	charmap "[",         $9e
	charmap "]",         $9f

	charmap "a",         $a0
	charmap "b",         $a1
	charmap "c",         $a2
	charmap "d",         $a3
	charmap "e",         $a4
	charmap "f",         $a5
	charmap "g",         $a6
	charmap "h",         $a7
	charmap "i",         $a8
	charmap "j",         $a9
	charmap "k",         $aa
	charmap "l",         $ab
	charmap "m",         $ac
	charmap "n",         $ad
	charmap "o",         $ae
	charmap "p",         $af
	charmap "q",         $b0
	charmap "r",         $b1
	charmap "s",         $b2
	charmap "t",         $b3
	charmap "u",         $b4
	charmap "v",         $b5
	charmap "w",         $b6
	charmap "x",         $b7
	charmap "y",         $b8
	charmap "z",         $b9

	charmap "'d",        $ba
	charmap "'l",        $bb
	charmap "'m",        $bc
	charmap "'r",        $bd
	charmap "'s",        $be
	charmap "'t",        $bf
	charmap "'v",        $c0
	charmap "é",         $c1

	charmap "<PK>",      $c2
	charmap "<MN>",      $c3
	charmap "<PO>",		 $c4
	charmap "<KE>",		 $c5

	charmap "0",         $c6
	charmap "1",         $c7
	charmap "2",         $c8
	charmap "3",         $c9
	charmap "4",         $ca
	charmap "5",         $cb
	charmap "6",         $cc
	charmap "7",         $cd
	charmap "8",         $ce
	charmap "9",         $cf

	charmap ",",         $d0
	charmap "'",         $d1
	charmap "“",         $d2 ; opening quote
	charmap "”",         $d3 ; closing quote
	charmap "&",         $d4
	charmap "<COLON>",   $d5 ; colon with tinier dots than ":"
	charmap "-",         $d6
	charmap "/",         $d7
	charmap ".",         $d8
	charmap "<DOT>",	 $d8 ; decimal point; same as "."
	charmap "?",         $d9
	charmap "!",         $da
	charmap "…",         $db ; ellipsis

	charmap "′",         $dc
	charmap "″",         $dd
	charmap "♂",         $de
	charmap "♀",         $df
	charmap "¥",         $e0 ; Poké Dollar sign
	charmap "×",         $e1
	charmap "←",         $e2
	charmap "▲",         $e3
	charmap "→",         $e4
	charmap "▷",         $e5
	charmap "▶",         $e6
	charmap "▼",         $e7

	charmap "<NOTE>",    $c0
	charmap "<UP>",		 $c1
	charmap "<DOWN>",	 $c2
	charmap "<LEFT>",	 $c3
	charmap "<RIGHT>",	 $c4
	charmap "<A>",		 $c5

	charmap "■",         $ef
	charmap "<BORDER>",  $ef

	charmap "　", $7f

; Unown charmap, for Unown words (see gfx/tilesets/ruins_of_alph.png)
pushc
	newcharmap unown
	DEF PRINTABLE_UNOWN EQUS "ABCDEFGHIJKLMNOPQRSTUVWXYZ-"
	for i, STRLEN("{PRINTABLE_UNOWN}")
		charmap STRSUB("{PRINTABLE_UNOWN}", i + 1, 1), $10 * (i / 8) + 2 * i
	endr
	charmap "@", $ff ; end
popc
