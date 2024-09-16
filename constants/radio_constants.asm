; radio channel ids
; indexes for:
; - RadioChannelSongs (see data/radio/channel_music.asm)
; - PlayRadioShow/RadioJumptable (see engine/pokegear/radio.asm)
; - RadioChannels (see engine/pokegear/pokegear.asm)
	const_def
	const OAKS_POKEMON_TALK      ; 00
	const POKEDEX_SHOW           ; 01
	const POKEMON_MUSIC          ; 02
	const PLACES_AND_PEOPLE      ; 03
	const LETS_ALL_SING          ; 04
	const ROCKET_RADIO           ; 05
	const POKE_FLUTE_RADIO       ; 06
	const UNOWN_RADIO            ; 07
	const EVOLUTION_RADIO        ; 08
DEF NUM_RADIO_CHANNELS EQU const_value
; internal indexes for channel segments
	const OAKS_POKEMON_TALK_2    ; 09
	const OAKS_POKEMON_TALK_3    ; 0a
	const OAKS_POKEMON_TALK_4    ; 0b
	const OAKS_POKEMON_TALK_5    ; 0c
	const OAKS_POKEMON_TALK_6    ; 0d
	const OAKS_POKEMON_TALK_7    ; 0e
	const OAKS_POKEMON_TALK_8    ; 0f
	const OAKS_POKEMON_TALK_9    ; 10
	const POKEDEX_SHOW_2         ; 11
	const POKEDEX_SHOW_3         ; 12
	const POKEDEX_SHOW_4         ; 13
	const POKEDEX_SHOW_5         ; 14
	const POKEMON_MUSIC_2        ; 15
	const POKEMON_MUSIC_3        ; 16
	const POKEMON_MUSIC_4        ; 17
	const POKEMON_MUSIC_5        ; 18
	const POKEMON_MUSIC_6        ; 19
	const POKEMON_MUSIC_7        ; 1a
	const LETS_ALL_SING_2        ; 1b
	const PLACES_AND_PEOPLE_2    ; 1c
	const PLACES_AND_PEOPLE_3    ; 2b
	const PLACES_AND_PEOPLE_4    ; 2c
	const PLACES_AND_PEOPLE_5    ; 2d
	const PLACES_AND_PEOPLE_6    ; 2e
	const PLACES_AND_PEOPLE_7    ; 2f
	const ROCKET_RADIO_2         ; 30
	const ROCKET_RADIO_3         ; 31
	const ROCKET_RADIO_4         ; 32
	const ROCKET_RADIO_5         ; 33
	const ROCKET_RADIO_6         ; 34
	const ROCKET_RADIO_7         ; 35
	const ROCKET_RADIO_8         ; 36
	const ROCKET_RADIO_9         ; 37
	const ROCKET_RADIO_10        ; 38
	const OAKS_POKEMON_TALK_10   ; 39
	const OAKS_POKEMON_TALK_11   ; 3a
	const OAKS_POKEMON_TALK_12   ; 3b
	const OAKS_POKEMON_TALK_13   ; 3c
	const OAKS_POKEMON_TALK_14   ; 3d
	const RADIO_SCROLL           ; 3e
	const POKEDEX_SHOW_6         ; 3f
	const POKEDEX_SHOW_7         ; 54
	const POKEDEX_SHOW_8         ; 55
DEF NUM_RADIO_SEGMENTS EQU const_value

; PlayRadioStationPointers indexes (see engine/pokegear/pokegear.asm)
	const_def
	const MAPRADIO_POKEMON_CHANNEL
	const MAPRADIO_OAKS_POKEMON_TALK
	const MAPRADIO_POKEDEX_SHOW
	const MAPRADIO_POKEMON_MUSIC
	const MAPRADIO_UNOWN
	const MAPRADIO_PLACES_PEOPLE
	const MAPRADIO_LETS_ALL_SING
	const MAPRADIO_ROCKET
DEF NUM_MAP_RADIO_STATIONS EQU const_value

; These tables in engine/pokegear/radio.asm are all sized to a power of 2
; so there's no need for a rejection sampling loop
DEF NUM_OAKS_POKEMON_TALK_ADVERBS    EQU 16 ; OaksPKMNTalk8.Adverbs
DEF NUM_OAKS_POKEMON_TALK_ADJECTIVES EQU 16 ; OaksPKMNTalk9.Adjectives
DEF NUM_PNP_PEOPLE_ADJECTIVES        EQU 16 ; PeoplePlaces5.Adjectives
DEF NUM_PNP_PLACES_ADJECTIVES        EQU 16 ; PeoplePlaces7.Adjectives
