Sfx_SelectItem:
	channel_count 1
	channel 5, Sfx_SelectItem_Ch5

Sfx_SelectItem_Ch5:
	toggle_sfx
	volume 7, 7
	duty_cycle 2
	octave 4
	note_type 4, 8, 7
	tempo 256
	note B_, 1
	note_type 1, 10, 7
	octave 5
	note E_, 1
	note_type 4, 11, 7
	note A_, 1
	octave 4
	note_type 4, 5, 7
	note B_, 1
	note_type 1, 4, 7
	octave 5
	note E_, 1
	note_type 4, 6, 7
	note A_, 1
	octave 4
	note_type 4, 3, 7
	note B_, 1
	octave 5
	note_type 1, 2, 7
	note E_, 1
	note_type 4, 4, 7
	note A_, 1
	octave 4
	note_type 4, 1, 7
	note B_, 1
	octave 5
	note_type 1, 1, 7
	note E_, 1
	note_type 4, 2, 7
	note A_, 1
	octave 4
	note_type 4, 1, 7
	note B_, 1
	note_type 1, 1, 7
	octave 5
	note E_, 1
	note_type 4, 1, 7
	tempo 200
	note A_, 1
	note_type 1, 1, 7
	rest 3
	note_type 12, 3, 7
	rest 1
	note_type 1, 3, 7
	rest 3
	note_type 12, 3, 7
	sound_ret

Sfx_MenuMove:
	channel_count 1
	channel 5, Sfx_MenuMove_Ch5

Sfx_MenuMove_Ch5:
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

Sfx_TextPrintDone:
	channel_count 1
	channel 5, Sfx_TextPrintDone_Ch5

Sfx_TextPrintDone_Ch5:
	togglesfx
	volume 7, 7
	octave 5
	duty_cycle 2
	tempo 128
	note_type 11, 15, 8
	note F#, 1
	note_type 1, 15, 8
	rest 1
	note_type 11, 15, 8
	note B_, 1
	octave 6
	note E_, 1
	note_type 1, 15, 8
	rest 14
	note_type 12, 15, 8
	sound_ret

Sfx_SolvePuzzle:
	channel_count 1
	channel 5, Sfx_SolvePuzzle_Ch5

Sfx_SolvePuzzle_Ch5:
	toggle_sfx
	volume 7, 7
	octave 5
	duty_cycle 2
	note_type 12, 15, 1
	tempo 150
	note F#, 1
	note F_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note D#, 1
	note G_, 1
	vibrato 0, 0, 0
	volume_envelope 15, 2
	note B_, 2
	rest 7
	sound_ret

Sfx_GetItem:
	channel_count 3
	channel 5, Sfx_GetItem_Ch5
	channel 6, Sfx_GetItem_Ch6
	channel 7, Sfx_GetItem_Ch7

Sfx_GetItem_Ch5:
	toggle_sfx
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
	toggle_sfx
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
	toggle_sfx
	note_type 12, 1, 0
	octave 4
	note F_, 1
	note F#, 1
	note G_, 1
	vibrato 2, 1, 0
	note G#, 7
	rest 2
	sound_ret
