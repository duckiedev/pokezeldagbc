Sfx_GetItem:
	channel_count 3
	channel 1, Sfx_GetItem_Ch5
	channel 2, Sfx_GetItem_Ch6
	channel 3, Sfx_GetItem_Ch7

Sfx_GetItem_Ch5:
	;toggle_sfx
	tempo 256
	volume 7, 7
	note_type 12, 15, 8
	octave 5
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 7
	rest 2
	sound_ret

Sfx_GetItem_Ch6:
	;toggle_sfx
	note_type 12, 10, 8
	octave 5
	note A_, 1
	note A#, 1
	note B_, 1
	octave 6
	note C_, 7
	rest 2
	sound_ret

Sfx_GetItem_Ch7:
	;toggle_sfx
	note_type 12, 1, 0
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	vibrato 2, 1, 0
	note G#, 7
	rest 2
	sound_ret