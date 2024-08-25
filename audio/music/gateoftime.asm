Music_GateOfTime:
	channel_count 4
	channel 1, Music_GateOfTime_Ch1
	channel 2, Music_GateOfTime_Ch2
	channel 3, Music_GateOfTime_Ch3
	channel 4, Music_GateOfTime_Ch4

Music_GateOfTime_Ch1:
	tempo 256
	volume 7, 7
	note_type 12, 15, 8
.mainLoop:
	duty_cycle 2
	note_type 12, 15, 2
	octave 3
	sound_call .sub1
	sound_call .sub2
	sound_call .sub1
	note_type 12, 15, 2
	note G_, 3
	note C_, 3
	octave 2
	note G_, 2
	octave 3
	note C_, 2
	note F_, 2
	sound_call .sub2
	note_type 12, 15, 2
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub2
	note_type 12, 15, 2
.loop1:
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub1
	note_type 12, 15, 2
	sound_call .sub2
	sound_loop 12, .loop1
	note_type 12, 15, 2
	octave 8
	rest 16
	rest 16
	rest 16
	rest 16
	rest 8
	sound_loop 0, .mainLoop

.sub1:
	note G_, 3
	note C_, 3
	octave 2
	note G_, 3
	octave 3
	note C_, 3
	sound_ret

.sub2:
	note F_, 3
	note C_, 3
	octave 2
	note G_, 3
	octave 3
	note C_, 3
	sound_ret

Music_GateOfTime_Ch2:
	note_type 12, 15, 8
.mainLoop:
	rest 16
	rest 16
	rest 16
	rest 16
	rest 14
	octave 5
	duty_cycle 2
	volume_envelope 15, 3
	vibrato 2, 1, 2
	note E_, 6
	rest 6
	octave 4
	note E_, 6
	octave 3
	note E_, 6
	octave 5
	note E_, 6
	rest 12
	octave 3
	note E_, 6
	octave 5
	note E_, 6
	rest 6
	octave 4
	note E_, 6
	octave 3
.loop1:
	note E_, 6
	octave 5
	note E_, 6
	rest 12
	octave 3
	note E_, 6
	octave 5
	note E_, 6
	rest 6
	octave 4
	note E_, 6
	octave 3
	sound_loop 11, .loop1
	octave 8
	note_type 12, 15, 8
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	sound_loop 0, .mainLoop

Music_GateOfTime_Ch3:
	note_type 12, 1, 0
.mainLoop:
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 8
	octave 3
	note A_, 12
	note D_, 12
	note G_, 12
	note D_, 12
	note_type 12, 1, 0
	note E_, 12
	note E_, 12
	sound_call .sub1
	octave 2
	note A_, 12
	note F_, 12
	note C_, 12
	note C_, 6
	octave 1
	note B_, 6
	octave 2
	note A_, 12
	note F_, 12
	octave 3
	sound_call .sub1
	octave 2
	note_type 12, 1, 0
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 8
	sound_loop 0, .mainLoop

.sub1:
	note C_, 12
	note C_, 12
	note D_, 6
	note C_, 12
	note C_, 12
	note C_, 12
	octave 2
	note A_, 12
	note A_, 12
	note A_, 6
	octave 3
	note C_, 12
	note C_, 12
	sound_ret

Music_GateOfTime_Ch4:
	toggle_noise 0
	drum_speed 12
.mainLoop:
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 13
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 1
	rest 1
	drum_speed 3
	rest 1
	drum_speed 1
	rest 14
	drum_speed 12
	rest 1
	drum_speed 8
	rest 1
	drum_speed 1
	rest 4
	drum_speed 12
	rest 6
	drum_speed 1
	rest 16
	rest 8
	drum_speed 12
	rest 5
	drum_speed 6
	rest 2
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 13
	drum_speed 3
	rest 12
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 5
	drum_speed 3
	rest 12
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 9
	drum_speed 1
	rest 6
	drum_speed 12
	rest 8
	octave 2
	drum_speed 3
	sound_call .sub1
	drum_speed 12
	rest 1
	drum_speed 1
	rest 6
	drum_speed 12
	rest 16
	rest 3
	drum_speed 6
	rest 2
	drum_speed 1
	rest 6
	drum_speed 12
	octave 8
	rest 16
	rest 16
	rest 16
	rest 16
	rest 6
	drum_speed 1
	rest 6
	drum_speed 12
	sound_loop 0, .mainLoop

.sub1:
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	drum_note 3, 1
	rest 1
	drum_speed 1
	rest 12
	drum_speed 6
	drum_note 3, 1
	drum_speed 1
	rest 3
	drum_speed 6
	drum_note 3, 1
	drum_speed 1
	rest 3
	drum_speed 6
	drum_note 3, 1
	sound_ret
