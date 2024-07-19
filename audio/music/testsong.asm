;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.2.0 (16-Nov-2022)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.
; ============================================================================================================

Music_TestSong:
	channel_count 4
	channel 1, Music_TestSong_Ch1
	channel 2, Music_TestSong_Ch2
	channel 3, Music_TestSong_Ch3
	channel 4, Music_TestSong_Ch4

Music_TestSong_Ch1:
	volume 7, 7
	duty_cycle 2
	note_type 12, 10, 7
	tempo 159
;Bar 1
	octave 2
	note C_, 2
	rest 2
	note G#, 2
	rest 2
	note G_, 2
	rest 4
	note C_, 2
;Bar 2
	rest 2
	note G#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note D#, 2
;Bar 3
	note C_, 2
	rest 2
	note G#, 2
	rest 2
	note G_, 2
	rest 4
	note C_, 2
;Bar 4
	rest 2
	note G#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note D#, 2
;Bar 5
	note C_, 2
	rest 2
	note G#, 2
	rest 2
	note G_, 2
	rest 4
	note C_, 2
;Bar 6
	rest 2
	note G#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note D#, 2
;Bar 7
	note C_, 2
	rest 2
	note G#, 2
	rest 2
	note G_, 2
	rest 4
	note C_, 2
;Bar 8
	rest 2
	note G#, 2
	note G_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F_, 2
	note D#, 2
	sound_ret

; ============================================================================================================

Music_TestSong_Ch2:
	duty_cycle 1
	note_type 12, 10, 7
;Bar 1
	octave 2
	note G_, 2
	rest 2
	octave 3
	note D#, 2
	rest 2
	note D_, 2
	rest 4
	octave 2
	note G_, 2
;Bar 2
	rest 2
	octave 3
	note D#, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
;Bar 3
	note G_, 2
	rest 2
	octave 3
	note D#, 2
	rest 2
	note D_, 2
	rest 4
	octave 2
	note G_, 2
;Bar 4
	rest 2
	octave 3
	note D#, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
;Bar 5
	note G_, 2
	rest 2
	octave 3
	note D#, 2
	rest 2
	note D_, 2
	rest 4
	octave 2
	note G_, 2
;Bar 6
	rest 2
	octave 3
	note D#, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
;Bar 7
	note G_, 2
	rest 2
	octave 3
	note D#, 2
	rest 2
	note D_, 2
	rest 4
	octave 2
	note G_, 2
;Bar 8
	rest 2
	octave 3
	note D#, 2
	note D_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note C#, 2
	note C_, 2
	octave 2
	note A#, 2
	sound_ret

; ============================================================================================================

Music_TestSong_Ch3:
	note_type 12, 1, 0
;Bar 1
	octave 3
	note C_, 2
	rest 4
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note C_, 2
;Bar 2
	rest 4
	octave 2
	note A#, 2
	rest 2
	note A_, 2
	rest 2
	note G_, 2
	rest 2
;Bar 3
	octave 3
	note C_, 2
	rest 4
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note C_, 2
;Bar 4
	rest 4
	octave 2
	note A#, 2
	rest 2
	note A_, 2
	rest 2
	note G_, 2
	rest 2
;Bar 5
	octave 3
	note C_, 2
	rest 4
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note C_, 2
;Bar 6
	rest 4
	octave 2
	note A#, 2
	rest 2
	note A_, 2
	rest 2
	note G_, 2
	rest 2
;Bar 7
	octave 3
	note C_, 2
	rest 4
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note C_, 2
;Bar 8
	rest 4
	octave 2
	note A#, 2
	rest 2
	note A_, 2
	rest 2
	note G_, 4
	sound_ret

; ============================================================================================================

Music_TestSong_Ch4:
	toggle_noise 1
	drum_speed 12
;Bar 1
	drum_note 4, 4
	drum_note 8, 4
	drum_note 8, 4
	drum_note 4, 4
;Bar 2
	drum_note 10, 4
	drum_note 4, 4
	drum_note 8, 2
	drum_note 4, 2
	drum_note 10, 2
	drum_note 4, 2
;Bar 3
	drum_note 4, 4
	drum_note 8, 4
	drum_note 8, 4
	drum_note 4, 4
;Bar 4
	drum_note 10, 4
	drum_note 4, 4
	drum_note 8, 2
	drum_note 4, 2
	drum_note 10, 2
	drum_note 4, 2
;Bar 5
	drum_note 4, 4
	drum_note 8, 4
	drum_note 8, 4
	drum_note 4, 4
;Bar 6
	drum_note 10, 4
	drum_note 4, 4
	drum_note 8, 2
	drum_note 4, 2
	drum_note 10, 2
	drum_note 4, 2
;Bar 7
	drum_note 4, 4
	drum_note 8, 4
	drum_note 8, 4
	drum_note 4, 4
;Bar 8
	drum_note 10, 4
	drum_note 4, 4
	drum_note 8, 2
	drum_note 4, 2
	drum_note 10, 2
	drum_note 4, 2
	sound_ret

; ============================================================================================================

