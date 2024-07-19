;Coverted using MIDI2ASM
;Code by TriteHexagon
;Version 5.2.0 (16-Nov-2022)
;Visit github.com/TriteHexagon/Midi2ASM-Converter for up-to-date versions.

; ============================================================================================================

Music_ZeldaTitle:
	channel_count 4
	channel 1, Music_ZeldaTitle_Ch1
	channel 2, Music_ZeldaTitle_Ch2
	channel 3, Music_ZeldaTitle_Ch3

Music_ZeldaTitle_Ch1:
	volume 7, 7
	duty_cycle 3
	vibrato 16, 1, 2
	note_type 12, 10, 7
	volume_envelope 10, 0
	tempo 159
;Bar 1
	note_type 8, 10, 7
	octave 3
	note A#, 4
	rest 2
	note F_, 8
	note_type 4, 11, 7
	rest 5
	note_type 12, 11, 7
	note A#, 1
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
;Bar 2
	note_type 8, 11, 7
	note F_, 8
	rest 7
	note_type 12, 11, 7
	note F_, 2
	note F_, 2
	note F#, 1
	note G#, 1
;Bar 3
	note_type 8, 11, 7
	note A#, 8
	rest 7
	note_type 12, 11, 7
	note A#, 2
	note A#, 2
	note G#, 1
	note F#, 1
;Bar 4
	note G#, 3
	note F#, 1
	note_type 8, 11, 7
	note F_, 8
	rest 4
	note F_, 4
	rest 2
;Bar 5
	note_type 12, 11, 7
	note D#, 3
	note F_, 1
	note_type 8, 11, 7
	note F#, 8
	rest 4
	note_type 12, 11, 7
	note F_, 2
	note D#, 2
;Bar 6
	note C#, 3
	note D#, 1
	note_type 8, 11, 7
	note F_, 8
	rest 4
	note_type 12, 11, 7
	note D#, 2
	note C#, 2
;Bar 7
	note C_, 3
	note D_, 1
	note_type 8, 11, 7
	note E_, 8
	rest 4
	note G_, 4
	rest 2
;Bar 8
	note_type 12, 11, 7
	note F_, 2
	octave 3
	note A#, 1
	note A#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	note_type 8, 11, 7
	note A#, 2
	rest 13
;Bar 9
	note_type 12, 11, 7
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 1
	note A_, 1
	note_type 8, 11, 7
	note A_, 2
	rest 10
;Bar 10
	note A#, 4
	rest 2
	note F_, 8
	note_type 4, 11, 7
	rest 5
	note_type 12, 11, 7
	note A#, 1
	note A#, 1
	octave 4
	note C_, 1
	note D_, 1
	note D#, 1
;Bar 11
	note_type 8, 11, 7
	note F_, 8
	rest 7
	note_type 12, 11, 7
	note F_, 2
	note F_, 2
	note F#, 1
	note G#, 1
;Bar 12
	note_type 8, 11, 7
	note A#, 8
	rest 7
	note_type 12, 11, 7
	note A#, 2
	note A#, 2
	note G#, 1
	note F#, 1
;Bar 13
	note G#, 3
	note F#, 1
	note_type 8, 11, 7
	note F_, 8
	rest 4
	note F_, 4
	rest 2
;Bar 14
	note_type 12, 11, 7
	note D#, 3
	note F_, 1
	note_type 8, 11, 7
	note F#, 8
	rest 4
	note_type 12, 11, 7
	note F_, 2
	note D#, 2
;Bar 15
	note C#, 3
	note D#, 1
	note_type 8, 11, 7
	note F_, 8
	rest 4
	note_type 12, 11, 7
	note D#, 2
	note C#, 2
;Bar 16
	note C_, 3
	note D_, 1
	note_type 8, 11, 7
	note E_, 8
	rest 4
	note G_, 4
	rest 2
;Bar 17
	note_type 12, 11, 7
	note F_, 2
	octave 3
	note A#, 1
	note A#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	note_type 8, 11, 7
	note A#, 2
	rest 13
;Bar 18
	note_type 12, 11, 7
	note A_, 1
	note A_, 1
	note A_, 2
	note A_, 1
	note A_, 1
	note_type 8, 11, 7
	note A_, 2
	rest 10
;Bar 19
	note_type 12, 11, 7
	octave 2
	note A#, 16
	sound_ret

; ============================================================================================================

Music_ZeldaTitle_Ch2:
	duty_cycle 3
	vibrato 20, 1, 2
	note_type 12, 10, 7
;Bar 1
	octave 1
	volume_envelope 10, 4
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note F_, 2
	rest 4
	note_type 12, 9, 7
	note F_, 2
	octave 1
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note F_, 2
	rest 4
	note_type 12, 9, 7
	note F_, 2
;Bar 2
	octave 1
	note G#, 2
	note_type 8, 9, 7
	octave 2
	note D#, 2
	rest 4
	note_type 12, 9, 7
	note D#, 2
	octave 1
	note G#, 2
	note_type 8, 9, 7
	octave 2
	note D#, 2
	rest 4
	note_type 12, 9, 7
	note D#, 2
;Bar 3
	octave 1
	note F#, 2
	note_type 8, 9, 7
	octave 2
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
	octave 1
	note F#, 2
	note_type 8, 9, 7
	octave 2
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
;Bar 4
	note C#, 2
	note_type 8, 9, 7
	octave 3
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
	octave 2
	note C#, 2
	note_type 8, 9, 7
	octave 3
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
;Bar 5
	octave 1
	note B_, 2
	note_type 8, 9, 7
	octave 2
	note B_, 2
	rest 4
	note_type 12, 9, 7
	note B_, 2
	octave 1
	note B_, 2
	note_type 8, 9, 7
	octave 2
	note B_, 2
	rest 4
	note_type 12, 9, 7
	note B_, 2
;Bar 6
	octave 1
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note A#, 2
	rest 4
	note_type 12, 9, 7
	note A#, 2
	octave 1
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note A#, 2
	rest 4
	note_type 12, 9, 7
	note A#, 2
;Bar 7
	note C_, 2
	note_type 8, 9, 7
	octave 3
	note C_, 2
	rest 4
	note_type 12, 9, 7
	note C_, 2
	octave 2
	note C_, 2
	note_type 8, 9, 7
	octave 3
	note C_, 2
	rest 4
	note C_, 2
	rest 4
;Bar 8
	note_type 12, 9, 7
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 2
	octave 2
	volume_envelope 9, 7
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
;Bar 9
	note F_, 2
	octave 3
	volume_envelope 11, 7
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 2
	octave 1
	volume_envelope 9, 7
	note F_, 1
	note F_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A_, 1
;Bar 10
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note F_, 2
	rest 4
	note_type 12, 9, 7
	note F_, 2
	octave 1
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note F_, 2
	rest 4
	note_type 12, 9, 7
	note F_, 2
;Bar 11
	octave 1
	note G#, 2
	note_type 8, 9, 7
	octave 2
	note D#, 2
	rest 4
	note_type 12, 9, 7
	note D#, 2
	octave 1
	note G#, 2
	note_type 8, 9, 7
	octave 2
	note D#, 2
	rest 4
	note_type 12, 9, 7
	note D#, 2
;Bar 12
	octave 1
	note F#, 2
	note_type 8, 9, 7
	octave 2
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
	octave 1
	note F#, 2
	note_type 8, 9, 7
	octave 2
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
;Bar 13
	note C#, 2
	note_type 8, 9, 7
	octave 3
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
	octave 2
	note C#, 2
	note_type 8, 9, 7
	octave 3
	note C#, 2
	rest 4
	note_type 12, 9, 7
	note C#, 2
;Bar 14
	octave 1
	note B_, 2
	note_type 8, 9, 7
	octave 2
	note B_, 2
	rest 4
	note_type 12, 9, 7
	note B_, 2
	octave 1
	note B_, 2
	note_type 8, 9, 7
	octave 2
	note B_, 2
	rest 4
	note_type 12, 9, 7
	note B_, 2
;Bar 15
	octave 1
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note A#, 2
	rest 4
	note_type 12, 9, 7
	note A#, 2
	octave 1
	note A#, 2
	note_type 8, 9, 7
	octave 2
	note A#, 2
	rest 4
	note_type 12, 9, 7
	note A#, 2
;Bar 16
	note C_, 2
	note_type 8, 9, 7
	octave 3
	note C_, 2
	rest 4
	note_type 12, 9, 7
	note C_, 2
	octave 2
	note C_, 2
	note_type 8, 9, 7
	octave 3
	note C_, 2
	rest 4
	note C_, 2
	rest 4
;Bar 17
	note_type 12, 9, 7
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 2
	octave 2
	note C_, 1
	note C_, 1
	note C_, 2
	note C_, 1
	note C_, 1
;Bar 18
	note F_, 2
	octave 3
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 1
	note F_, 1
	note F_, 2
	octave 1
	note F_, 1
	note F_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A_, 1
;Bar 19
	note A#, 16
	sound_ret

; ============================================================================================================

Music_ZeldaTitle_Ch3:
	vibrato 16, 1, 4
	note_type 12, 1, 0
;Bar 1
	volume_envelope 2, 0
	rest 16
	rest 2
;Bar 2
	octave 5
	volume_envelope 1, 0
	note A#, 2
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note_type 8, 1, 0
	note F_, 8
	rest 10
;Bar 3
	note_type 12, 1, 0
	note C#, 1
	note F#, 1
	note G#, 1
	note A#, 1
	note_type 8, 1, 0
	octave 7
	note C#, 8
	rest 13
;Bar 4
	note_type 12, 1, 0
	octave 6
	note C#, 1
	note D#, 1
	note F_, 2
	note C#, 2
	note_type 8, 1, 0
	octave 5
	note G#, 4
	rest 11
;Bar 5
	note_type 12, 1, 0
	octave 6
	note D#, 1
	note F_, 1
	note F#, 2
	note D#, 1
	note F_, 1
	note_type 8, 1, 0
	note F#, 2
	rest 13
;Bar 6
	note_type 12, 1, 0
	note C#, 1
	note D#, 1
	note F_, 2
	note C#, 1
	note D#, 1
	note_type 8, 1, 0
	note F_, 2
	rest 13
;Bar 7
	note_type 12, 1, 0
	note C_, 1
	note D_, 1
	note E_, 2
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
;Bar 8
	note_type 8, 1, 0
	octave 6
	note A_, 2
	rest 16
	rest 16
	rest 16
	rest 16
	rest 9
;Bar 11
	note_type 12, 1, 0
	octave 5
	note A#, 2
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note_type 8, 1, 0
	note F_, 8
	rest 10
;Bar 12
	note_type 12, 1, 0
	note C#, 1
	note F#, 1
	note G#, 1
	note A#, 1
	note_type 8, 1, 0
	octave 7
	note C#, 8
	rest 13
;Bar 13
	note_type 12, 1, 0
	octave 6
	note C#, 1
	note D#, 1
	note F_, 2
	note C#, 2
	note_type 8, 1, 0
	octave 5
	note G#, 4
	rest 11
;Bar 14
	note_type 12, 1, 0
	octave 6
	note D#, 1
	note F_, 1
	note F#, 2
	note D#, 1
	note F_, 1
	note_type 8, 1, 0
	note F#, 2
	rest 13
;Bar 15
	note_type 12, 1, 0
	note C#, 1
	note D#, 1
	note F_, 2
	note C#, 1
	note D#, 1
	note_type 8, 1, 0
	note F_, 2
	rest 13
;Bar 16
	note_type 12, 1, 0
	note C_, 1
	note D_, 1
	note E_, 2
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
;Bar 17
	octave 6
	note A_, 16
	note A_, 16
	note A_, 16
	sound_ret

; ============================================================================================================

