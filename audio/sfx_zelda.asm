Sfx_TextPrint:
	channel_count 1
	channel 5, Sfx_TextPrint_Ch5

Sfx_TextPrint_Ch5:
	toggle_sfx
	tempo 256
	volume 7, 7
	duty_cycle 2
	note_type 1, 12, 8
	octave 5
	note F_, 1
	volume_envelope 15, 8
	note F_, 1
	octave 4
	note_type 12, 15, 8
	sound_ret
