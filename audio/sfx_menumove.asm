Music_Sfx_MenuMove:
	channel_count 1
	channel 5, Music_Sfx_MenuMove_Ch5

Music_Sfx_MenuMove_Ch5:
	toggle_sfx
	tempo 256
	volume 7, 7
	octave 5
	duty_cycle 2
	note_type 2, 15, 8
	sound_call .sub1
	note_type 2, 4, 8
	note A_, 1
	note_type 1, 15, 8
	rest 2
	note_type 12, 15, 8
	sound_ret

.sub1:
	note A_, 1
	sound_ret
