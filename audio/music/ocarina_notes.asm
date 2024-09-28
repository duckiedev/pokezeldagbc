Music_OcarinaNoteB5: ; D_UP
	channel_count 1
	channel 3, Music_OcarinaNoteB5_Ch3

Music_OcarinaNoteB5_Ch3:
	tempo 256
	volume 7, 7
	note_type 12, 1, 0
.mainLoop:
	octave 5
	vibrato 16, 2, 4
	note B_, 16
	sound_loop 0, .mainLoop


Music_OcarinaNoteA5: ; D_RIGHT
	channel_count 1
	channel 3, Music_OcarinaNoteA5_Ch3

Music_OcarinaNoteA5_Ch3:
	tempo 256
	volume 7, 7
	note_type 12, 1, 0
.mainLoop:
	octave 5
	vibrato 16, 2, 4
	note A_, 16
	sound_loop 0, .mainLoop


Music_OcarinaNoteF5: ; D_LEFT
	channel_count 1
	channel 3, Music_OcarinaNoteF5_Ch3

Music_OcarinaNoteF5_Ch3:
	tempo 256
	volume 7, 7
	note_type 12, 1, 0
.mainLoop:
	octave 5
	vibrato 16, 2, 4
	note F_, 16
	sound_loop 0, .mainLoop


Music_OcarinaNoteD5: ; D_DOWN
	channel_count 1
	channel 3, Music_OcarinaNoteD5_Ch3

Music_OcarinaNoteD5_Ch3:
	tempo 256
	volume 7, 7
	note_type 12, 1, 0
.mainLoop:
	octave 5
	vibrato 16, 2, 4
	note D_, 16
	sound_loop 0, .mainLoop


Music_OcarinaNoteB4: ; BUTTON_A
	channel_count 1
	channel 3, Music_OcarinaNoteB4_Ch3

Music_OcarinaNoteB4_Ch3:
	tempo 256
	volume 7, 7
	note_type 12, 1, 0
.mainLoop:
	vibrato 16, 2, 4
	octave 4
	note B_, 16
	sound_loop 0, .mainLoop
