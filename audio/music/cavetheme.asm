Music_CaveTheme:
	channel_count 3
	channel 1, Music_CaveTheme_Ch1
	channel 2, Music_CaveTheme_Ch2
	channel 3, Music_CaveTheme_Ch3

Music_CaveTheme_Ch1:
	volume 7, 7
	duty_cycle 2
	note_type 12, 9, -7
	tempo 159
	octave 3
	vibrato 3, 2, 2
	note F_, 16
	note G#, 16
	octave 4
	note D#, 16
	rest 16
	octave 3
	note D#, 16
	octave 4
	note D#, 16
	octave 3
	note G#, 16
	rest 16
	note C#, 16
	octave 4
	note C#, 16
	octave 3
	note F#, 16
	rest 16
	note F#, 16
	note F_, 8
	note C#, 8
	note F_, 8
	note D#, 8
	note F#, 8
	note F_, 8
	sound_loop 0, Music_CaveTheme_Ch1

Music_CaveTheme_Ch2:
	duty_cycle 1
	note_type 12, 9, 7
	octave 3
.loop1:
	volume_envelope 9, 1
	note C_, 1
	note C#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note C#, 1
	sound_loop 8, .loop1
.loop2:
	note C_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	sound_loop 8, .loop2
	octave 2
.loop3:
	note A#, 1
	octave 3
	note D#, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	octave 2
	sound_loop 8, .loop3
	octave 2
.loop4:
	note G_, 1
	octave 3
	note C#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note D#, 1
	note C#, 1
	octave 2
	sound_loop 4, .loop4
	octave 2
.loop5:
	note G#, 1
	octave 3
	note C_, 1
	note D#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note D#, 1
	note C_, 1
	octave 2
	sound_loop 2, .loop5
	octave 2
.loop6:
	note A_, 1
	octave 3
	note D#, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	octave 2
	sound_loop 2, .loop6
	octave 3
	sound_loop 0, Music_CaveTheme_Ch2

Music_CaveTheme_Ch3:
	note_type 12, 2, 0
	octave 4
	vibrato 22, 2, 0
	note C#, 16
	note F_, 16
	note G#, 16
	octave 3
	note C#, 1
	rest 1
	note C#, 2
	rest 4
	note C#, 1
	rest 3
	note C#, 2
	rest 2
	octave 4
	note G_, 16
	note A#, 16
	octave 5
	note C_, 16
	rest 6
	octave 3
	note D#, 1
	rest 1
	note G#, 1
	rest 1
	note G_, 1
	rest 1
	note F_, 1
	rest 1
	note C_, 1
	rest 1
	note A#, 16
	octave 4
	note G#, 16
	note D#, 16
	rest 4
	note C#, 4
	note C_, 4
	octave 3
	note G#, 4
	note A#, 16
	note A#, 16
	note G#, 16
	note A_, 16
	sound_loop 0, Music_CaveTheme_Ch3
