TypeMatchups:
	;  attacker,     defender,     *=
	db NORMAL,       ROCK,         NOT_VERY_EFFECTIVE
	db NORMAL,       STEEL,        NOT_VERY_EFFECTIVE
	db FIRE,         FIRE,         NOT_VERY_EFFECTIVE
	db FIRE,         WATER,        NOT_VERY_EFFECTIVE
	db FIRE,         FOREST,        SUPER_EFFECTIVE
	db FIRE,         ICE,          SUPER_EFFECTIVE
	db FIRE,         BUG,          SUPER_EFFECTIVE
	db FIRE,         ROCK,         NOT_VERY_EFFECTIVE
	db FIRE,         DRAGON,       NOT_VERY_EFFECTIVE
	db FIRE,         STEEL,        SUPER_EFFECTIVE
	db WATER,        FIRE,         SUPER_EFFECTIVE
	db WATER,        WATER,        NOT_VERY_EFFECTIVE
	db WATER,        FOREST,        NOT_VERY_EFFECTIVE
	db WATER,        GROUND,       SUPER_EFFECTIVE
	db WATER,        ROCK,         SUPER_EFFECTIVE
	db WATER,        DRAGON,       NOT_VERY_EFFECTIVE
	db ELECTRIC,     WATER,        SUPER_EFFECTIVE
	db ELECTRIC,     ELECTRIC,     NOT_VERY_EFFECTIVE
	db ELECTRIC,     FOREST,        NOT_VERY_EFFECTIVE
	db ELECTRIC,     GROUND,       NO_EFFECT
	db ELECTRIC,     FLYING,       SUPER_EFFECTIVE
	db ELECTRIC,     DRAGON,       NOT_VERY_EFFECTIVE
	db FOREST,        FIRE,         NOT_VERY_EFFECTIVE
	db FOREST,        WATER,        SUPER_EFFECTIVE
	db FOREST,        FOREST,        NOT_VERY_EFFECTIVE
	db FOREST,        POISON,       NOT_VERY_EFFECTIVE
	db FOREST,        GROUND,       SUPER_EFFECTIVE
	db FOREST,        FLYING,       NOT_VERY_EFFECTIVE
	db FOREST,        BUG,          NOT_VERY_EFFECTIVE
	db FOREST,        ROCK,         SUPER_EFFECTIVE
	db FOREST,        DRAGON,       NOT_VERY_EFFECTIVE
	db FOREST,        STEEL,        NOT_VERY_EFFECTIVE
	db ICE,          WATER,        NOT_VERY_EFFECTIVE
	db ICE,          FOREST,        SUPER_EFFECTIVE
	db ICE,          ICE,          NOT_VERY_EFFECTIVE
	db ICE,          GROUND,       SUPER_EFFECTIVE
	db ICE,          FLYING,       SUPER_EFFECTIVE
	db ICE,          DRAGON,       SUPER_EFFECTIVE
	db ICE,          STEEL,        NOT_VERY_EFFECTIVE
	db ICE,          FIRE,         NOT_VERY_EFFECTIVE
	db WARRIOR,     NORMAL,       SUPER_EFFECTIVE
	db WARRIOR,     ICE,          SUPER_EFFECTIVE
	db WARRIOR,     POISON,       NOT_VERY_EFFECTIVE
	db WARRIOR,     FLYING,       NOT_VERY_EFFECTIVE
	db WARRIOR,     PSYCHIC_TYPE, NOT_VERY_EFFECTIVE
	db WARRIOR,     BUG,          NOT_VERY_EFFECTIVE
	db WARRIOR,     ROCK,         SUPER_EFFECTIVE
	db WARRIOR,     DARK,         SUPER_EFFECTIVE
	db WARRIOR,     STEEL,        SUPER_EFFECTIVE
	db POISON,       FOREST,        SUPER_EFFECTIVE
	db POISON,       POISON,       NOT_VERY_EFFECTIVE
	db POISON,       GROUND,       NOT_VERY_EFFECTIVE
	db POISON,       ROCK,         NOT_VERY_EFFECTIVE
	db POISON,       GHOST,        NOT_VERY_EFFECTIVE
	db POISON,       STEEL,        NO_EFFECT
	db GROUND,       FIRE,         SUPER_EFFECTIVE
	db GROUND,       ELECTRIC,     SUPER_EFFECTIVE
	db GROUND,       FOREST,        NOT_VERY_EFFECTIVE
	db GROUND,       POISON,       SUPER_EFFECTIVE
	db GROUND,       FLYING,       NO_EFFECT
	db GROUND,       BUG,          NOT_VERY_EFFECTIVE
	db GROUND,       ROCK,         SUPER_EFFECTIVE
	db GROUND,       STEEL,        SUPER_EFFECTIVE
	db FLYING,       ELECTRIC,     NOT_VERY_EFFECTIVE
	db FLYING,       FOREST,        SUPER_EFFECTIVE
	db FLYING,       WARRIOR,     SUPER_EFFECTIVE
	db FLYING,       BUG,          SUPER_EFFECTIVE
	db FLYING,       ROCK,         NOT_VERY_EFFECTIVE
	db FLYING,       STEEL,        NOT_VERY_EFFECTIVE
	db PSYCHIC_TYPE, WARRIOR,     SUPER_EFFECTIVE
	db PSYCHIC_TYPE, POISON,       SUPER_EFFECTIVE
	db PSYCHIC_TYPE, PSYCHIC_TYPE, NOT_VERY_EFFECTIVE
	db PSYCHIC_TYPE, DARK,         NO_EFFECT
	db PSYCHIC_TYPE, STEEL,        NOT_VERY_EFFECTIVE
	db BUG,          FIRE,         NOT_VERY_EFFECTIVE
	db BUG,          FOREST,        SUPER_EFFECTIVE
	db BUG,          WARRIOR,     NOT_VERY_EFFECTIVE
	db BUG,          POISON,       NOT_VERY_EFFECTIVE
	db BUG,          FLYING,       NOT_VERY_EFFECTIVE
	db BUG,          PSYCHIC_TYPE, SUPER_EFFECTIVE
	db BUG,          GHOST,        NOT_VERY_EFFECTIVE
	db BUG,          DARK,         SUPER_EFFECTIVE
	db BUG,          STEEL,        NOT_VERY_EFFECTIVE
	db ROCK,         FIRE,         SUPER_EFFECTIVE
	db ROCK,         ICE,          SUPER_EFFECTIVE
	db ROCK,         WARRIOR,     NOT_VERY_EFFECTIVE
	db ROCK,         GROUND,       NOT_VERY_EFFECTIVE
	db ROCK,         FLYING,       SUPER_EFFECTIVE
	db ROCK,         BUG,          SUPER_EFFECTIVE
	db ROCK,         STEEL,        NOT_VERY_EFFECTIVE
	db GHOST,        NORMAL,       NO_EFFECT
	db GHOST,        PSYCHIC_TYPE, SUPER_EFFECTIVE
	db GHOST,        DARK,         NOT_VERY_EFFECTIVE
	db GHOST,        STEEL,        NOT_VERY_EFFECTIVE
	db GHOST,        GHOST,        SUPER_EFFECTIVE
	db DRAGON,       DRAGON,       SUPER_EFFECTIVE
	db DRAGON,       STEEL,        NOT_VERY_EFFECTIVE
	db DARK,         WARRIOR,     NOT_VERY_EFFECTIVE
	db DARK,         PSYCHIC_TYPE, SUPER_EFFECTIVE
	db DARK,         GHOST,        SUPER_EFFECTIVE
	db DARK,         DARK,         NOT_VERY_EFFECTIVE
	db DARK,         STEEL,        NOT_VERY_EFFECTIVE
	db STEEL,        FIRE,         NOT_VERY_EFFECTIVE
	db STEEL,        WATER,        NOT_VERY_EFFECTIVE
	db STEEL,        ELECTRIC,     NOT_VERY_EFFECTIVE
	db STEEL,        ICE,          SUPER_EFFECTIVE
	db STEEL,        ROCK,         SUPER_EFFECTIVE
	db STEEL,        STEEL,        NOT_VERY_EFFECTIVE

	db -2 ; end (with Foresight)

; Foresight removes Ghost's immunities.
	db NORMAL,       GHOST,        NO_EFFECT
	db WARRIOR,     GHOST,        NO_EFFECT

	db -1 ; end
