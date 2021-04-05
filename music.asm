; asmsyntax=ca65

SongMeta:
	.word SongList
	.word InstrumentList
	.word InstrumentMacroList

InstrumentMacroList:
	.word macro_0_0
	.word macro_0_1
	.word macro_0_2
	.word macro_0_3
	.word macro_0_4
	.word macro_0_5
	.word macro_0_6
	.word macro_0_7
	.word macro_0_10
	.word macro_0_13
	.word macro_0_14
	.word macro_0_18
	.word macro_0_19
	.word macro_0_21
	.word macro_0_22
	.word macro_0_23
	.word macro_1_0
	.word macro_1_1
	.word macro_1_2
	.word macro_1_3
	.word macro_1_4
	.word macro_1_6
	.word macro_1_7
	.word macro_2_0
	.word macro_2_7
	.word macro_4_9

macro_0_0:
	.byte 255
	.byte 255
	.byte 1
	.byte 10

macro_0_1:
	.byte 255
	.byte 255
	.byte 8
	.byte 15, 14, 12, 10, 8, 3, 1, 0

macro_0_2:
	.byte 255
	.byte 255
	.byte 12
	.byte 13, 12, 9, 8, 7, 5, 3, 2, 1, 1, 1, 0

macro_0_3:
	.byte 255
	.byte 255
	.byte 1
	.byte 4

macro_0_4:
	.byte 255
	.byte 255
	.byte 5
	.byte 6, 4, 2, 1, 0

macro_0_5:
	.byte 255
	.byte 255
	.byte 4
	.byte 5, 4, 2, 2

macro_0_6:
	.byte 255
	.byte 255
	.byte 44
	.byte 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10

macro_0_7:
	.byte 255
	.byte 255
	.byte 40
	.byte 10, 10, 10, 10, 9, 9, 9, 9, 8, 8, 8, 8, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1

macro_0_10:
	.byte 255
	.byte 255
	.byte 40
	.byte 11, 11, 11, 11, 9, 9, 9, 9, 8, 8, 8, 8, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 1, 1, 1, 1

macro_0_13:
	.byte 255
	.byte 255
	.byte 1
	.byte 2

macro_0_14:
	.byte 255
	.byte 255
	.byte 1
	.byte 1

macro_0_18:
	.byte 255
	.byte 255
	.byte 1
	.byte 7

macro_0_19:
	.byte 255
	.byte 255
	.byte 13
	.byte 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1

macro_0_21:
	.byte 255
	.byte 255
	.byte 5
	.byte 10, 7, 4, 2, 0

macro_0_22:
	.byte 255
	.byte 255
	.byte 16
	.byte 15, 14, 12, 10, 9, 8, 7, 6, 5, 5, 3, 3, 3, 3, 3, 1

macro_0_23:
	.byte 255
	.byte 255
	.byte 5
	.byte 4, 3, 2, 1, 0

macro_1_0:
	.byte 255
	.byte 255
	.byte 6
	.byte 24, 22, 17, 5, 1, 0

macro_1_1:
	.byte 255
	.byte 255
	.byte 9
	.byte 0, 254, 251, 248, 242, 240, 238, 234, 232

macro_1_2:
	.byte 255
	.byte 255
	.byte 5
	.byte 12, 8, 5, 2, 0

macro_1_3:
	.byte 255
	.byte 255
	.byte 4
	.byte 9, 0, 0, 0

macro_1_4:
	.byte 255
	.byte 255
	.byte 26
	.byte 0, 0, 255, 255, 254, 254, 253, 253, 252, 252, 251, 251, 250, 250, 249, 249, 248, 248, 247, 247, 246, 246, 245, 245, 244, 244

macro_1_6:
	.byte 255
	.byte 255
	.byte 4
	.byte 12, 0, 0, 0

macro_1_7:
	.byte 255
	.byte 255
	.byte 2
	.byte 252, 0

macro_2_0:
	.byte 0
	.byte 255
	.byte 12
	.byte 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 255, 255

macro_2_7:
	.byte 0
	.byte 255
	.byte 10
	.byte 255, 254, 255, 0, 0, 1, 2, 1, 0, 0

macro_4_9:
	.byte 255
	.byte 255
	.byte 1
	.byte 3


InstrumentList:
	.word inst_00
	.word inst_01
	.word inst_02
	.word inst_03
	.word inst_04
	.word inst_05
	.word inst_06
	.word inst_07
	.word inst_08
	.word inst_09
	.word inst_0A
	.word inst_0B
	.word inst_0C
	.word inst_0D
	.word inst_0E
	.word inst_0F
	.word inst_10
	.word inst_11
	.word inst_12
	.word inst_13
	.word inst_14
	.word inst_15
	.word inst_16
; Kick
inst_00:
	.byte 1
	.byte 16
	.byte 255
	.byte 255
	.byte 9

; Snare Sq
inst_01:
	.byte 2
	.byte 17
	.byte 255
	.byte 255
	.byte 9

; Quiet Hat Closed
inst_02:
	.byte 4
	.byte 19
	.byte 255
	.byte 255
	.byte 255

; Quiet Hat Open
inst_03:
	.byte 5
	.byte 19
	.byte 255
	.byte 255
	.byte 255

; Bass V10 PW2
inst_04:
	.byte 0
	.byte 255
	.byte 255
	.byte 255
	.byte 9

; Bass V10 PW2 w/ Perc
inst_05:
	.byte 3
	.byte 18
	.byte 255
	.byte 255
	.byte 9

; Swell V1-10 PW0
inst_06:
	.byte 6
	.byte 255
	.byte 255
	.byte 255
	.byte 255

; Decay 10-10 PW0
inst_07:
	.byte 7
	.byte 255
	.byte 255
	.byte 255
	.byte 255

; Swell V1-10 PW1
inst_08:
	.byte 6
	.byte 255
	.byte 255
	.byte 255
	.byte 10

; Decay 10-10 PW1
inst_09:
	.byte 7
	.byte 255
	.byte 255
	.byte 255
	.byte 10

; Swell V1-10 PW2
inst_0A:
	.byte 6
	.byte 255
	.byte 255
	.byte 255
	.byte 9

; Decay 10-10 PW2
inst_0B:
	.byte 8
	.byte 255
	.byte 255
	.byte 255
	.byte 9

; Vibrato V1 PW0
inst_0C:
	.byte 9
	.byte 255
	.byte 23
	.byte 255
	.byte 255

; Vibrato V1 PW1
inst_0D:
	.byte 10
	.byte 255
	.byte 23
	.byte 255
	.byte 10

; Vibrato V1 PW2
inst_0E:
	.byte 10
	.byte 255
	.byte 23
	.byte 255
	.byte 9

; Vibrato V10 PW0
inst_0F:
	.byte 0
	.byte 255
	.byte 23
	.byte 255
	.byte 255

; Vibrato V10 PW1
inst_10:
	.byte 0
	.byte 255
	.byte 23
	.byte 255
	.byte 10

; Vibrato V10 PW2
inst_11:
	.byte 11
	.byte 255
	.byte 23
	.byte 255
	.byte 9

; Long Drop V15 pw3
inst_12:
	.byte 12
	.byte 20
	.byte 24
	.byte 255
	.byte 25

; Long Drop V15 pw2
inst_13:
	.byte 9
	.byte 20
	.byte 255
	.byte 255
	.byte 9

; Louder Stac Noise
inst_14:
	.byte 13
	.byte 21
	.byte 255
	.byte 255
	.byte 10

; Quieter Stac Noise
inst_15:
	.byte 15
	.byte 21
	.byte 255
	.byte 255
	.byte 10

; Snare Noise
inst_16:
	.byte 14
	.byte 22
	.byte 255
	.byte 255
	.byte 255

SongList:
	.word song_0 ; Title Screen
	.word song_1 ; Level Music 1
	.word song_2 ; Level Music 2
	.word song_3 ; Game Over

song_0:
	.byte 64
	.byte 8
	.byte 150
	.byte 3

	.word song_0_frameList_pulseA
	.word song_0_frameList_pulseB
	.word song_0_frameList_triangle
	.word song_0_frameList_noise

	.byte 2

	.word song_0_order_pulseA
	.word song_0_order_pulseB
	.word song_0_order_triangle
	.word song_0_order_noise

song_0_frameList_pulseA:
	.word song_0_frameList_pulseA_0
	.word song_0_frameList_pulseA_1
	.word song_0_frameList_pulseA_2

song_0_frameList_pulseB:
	.word song_0_frameList_pulseB_0
	.word song_0_frameList_pulseB_1
	.word song_0_frameList_pulseB_2

song_0_frameList_triangle:
	.word song_0_frameList_triangle_0
	.word song_0_frameList_triangle_1
	.word song_0_frameList_triangle_2

song_0_frameList_noise:
	.word song_0_frameList_noise_0
	.word song_0_frameList_noise_1
	.word song_0_frameList_noise_2

song_0_frameList_pulseA_0:
	.byte SoundEngine::CMD::Instrument, 22, SoundEngine::Note::F2, SoundEngine::Note::C3, SoundEngine::Note::F3, SoundEngine::Note::C4, SoundEngine::Note::Ds4, SoundEngine::Note::G4, SoundEngine::Note::C5, SoundEngine::Note::Gs4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::C4, SoundEngine::Note::As3, SoundEngine::Note::F2, SoundEngine::Note::C3, SoundEngine::Note::F3, SoundEngine::Note::C4, SoundEngine::Note::Ds4, SoundEngine::Note::G4, SoundEngine::Note::C5, SoundEngine::Note::Gs4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::C4, SoundEngine::Note::As3, SoundEngine::Note::Ds2, SoundEngine::Note::As2, SoundEngine::Note::Ds3, SoundEngine::Note::As3, SoundEngine::Note::Cs4, SoundEngine::Note::F4, SoundEngine::Note::As4, SoundEngine::Note::Fs4, SoundEngine::Note::F4, SoundEngine::Note::Cs4, SoundEngine::Note::As3, SoundEngine::Note::Gs3, SoundEngine::Note::Cs2, SoundEngine::Note::Gs2, SoundEngine::Note::Cs3, SoundEngine::Note::Gs3, SoundEngine::Note::B3, SoundEngine::Note::Ds4, SoundEngine::Note::Gs4, SoundEngine::Note::E4, SoundEngine::Note::Ds4, SoundEngine::Note::B3, SoundEngine::Note::Gs3, SoundEngine::CMD::Skip, $00, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $10

song_0_frameList_pulseA_1:
	.byte SoundEngine::CMD::Instrument, 22, SoundEngine::Note::C2, SoundEngine::Note::G2, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::As3, SoundEngine::Note::D4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::D4, SoundEngine::Note::As3, SoundEngine::Note::G3, SoundEngine::Note::Ds3, SoundEngine::Note::C2, SoundEngine::Note::G2, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::As3, SoundEngine::Note::D4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::D4, SoundEngine::Note::As3, SoundEngine::Note::G3, SoundEngine::Note::F3, SoundEngine::Note::C2, SoundEngine::Note::G2, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::As3, SoundEngine::Note::D4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::D4, SoundEngine::Note::As3, SoundEngine::Note::G3, SoundEngine::Note::Ds3, SoundEngine::Note::C2, SoundEngine::Note::G2, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::As3, SoundEngine::Note::D4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::D4, SoundEngine::Note::As3, SoundEngine::Note::G3, SoundEngine::CMD::Skip, $00, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $10

song_0_frameList_pulseA_2:
	.byte SoundEngine::CMD::Wait, $40

song_0_frameList_pulseB_0:
	.byte SoundEngine::CMD::Instrument, 10, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $17, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::Cs2, SoundEngine::CMD::Wait, $1B

song_0_frameList_pulseB_1:
	.byte SoundEngine::CMD::Instrument, 10, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $17, SoundEngine::Note::As1, SoundEngine::CMD::Wait, $11, SoundEngine::CMD::Instrument, 4, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $11

song_0_frameList_pulseB_2:
	.byte SoundEngine::CMD::Wait, $40

song_0_frameList_triangle_0:
	.byte SoundEngine::CMD::Instrument, 4, SoundEngine::Note::F3, SoundEngine::Note::C4, SoundEngine::Note::F4, SoundEngine::Note::C5, SoundEngine::Note::Ds5, SoundEngine::Note::G5, SoundEngine::Note::C6, SoundEngine::Note::Gs5, SoundEngine::Note::G5, SoundEngine::Note::Ds5, SoundEngine::Note::C5, SoundEngine::Note::As4, SoundEngine::Note::F3, SoundEngine::Note::C4, SoundEngine::Note::F4, SoundEngine::Note::C5, SoundEngine::Note::Ds5, SoundEngine::Note::G5, SoundEngine::Note::C6, SoundEngine::Note::Gs5, SoundEngine::Note::G5, SoundEngine::Note::Ds5, SoundEngine::Note::C5, SoundEngine::Note::As4, SoundEngine::Note::Ds3, SoundEngine::Note::As3, SoundEngine::Note::Ds4, SoundEngine::Note::As4, SoundEngine::Note::Cs5, SoundEngine::Note::F5, SoundEngine::Note::As5, SoundEngine::Note::Fs5, SoundEngine::Note::F5, SoundEngine::Note::Cs5, SoundEngine::Note::As4, SoundEngine::Note::Gs4, SoundEngine::Note::Cs3, SoundEngine::Note::Gs3, SoundEngine::Note::Cs4, SoundEngine::Note::Gs4, SoundEngine::Note::B4, SoundEngine::Note::Ds5, SoundEngine::Note::Gs5, SoundEngine::Note::E5, SoundEngine::Note::Ds5, SoundEngine::Note::B4, SoundEngine::Note::Gs4, SoundEngine::CMD::Skip, $00, SoundEngine::Note::Fs4, SoundEngine::CMD::Wait, $10

song_0_frameList_triangle_1:
	.byte SoundEngine::CMD::Instrument, 4, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::C4, SoundEngine::Note::G4, SoundEngine::Note::As4, SoundEngine::Note::D5, SoundEngine::Note::G5, SoundEngine::Note::Ds5, SoundEngine::Note::D5, SoundEngine::Note::As4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::C4, SoundEngine::Note::G4, SoundEngine::Note::As4, SoundEngine::Note::D5, SoundEngine::Note::G5, SoundEngine::Note::Ds5, SoundEngine::Note::D5, SoundEngine::Note::As4, SoundEngine::Note::G4, SoundEngine::Note::F4, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::C4, SoundEngine::Note::G4, SoundEngine::Note::As4, SoundEngine::Note::D5, SoundEngine::Note::G5, SoundEngine::Note::Ds5, SoundEngine::Note::D5, SoundEngine::Note::As4, SoundEngine::Note::G4, SoundEngine::Note::Ds4, SoundEngine::Note::C3, SoundEngine::Note::G3, SoundEngine::Note::C4, SoundEngine::Note::G4, SoundEngine::Note::As4, SoundEngine::Note::D5, SoundEngine::Note::G5, SoundEngine::Note::Ds5, SoundEngine::Note::D5, SoundEngine::Note::As4, SoundEngine::Note::G4, SoundEngine::CMD::Skip, $00, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $10

song_0_frameList_triangle_2:
	.byte SoundEngine::CMD::Instrument, 18, SoundEngine::Note::F5, SoundEngine::CMD::Wait, $02, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $02, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $02, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $36

song_0_frameList_noise_0:
	.byte $00, SoundEngine::CMD::Instrument, 7, SoundEngine::CMD::Wait, $0B, $03, SoundEngine::CMD::Wait, $0B, $00, SoundEngine::CMD::Wait, $0B, $03, SoundEngine::CMD::Wait, $1B

song_0_frameList_noise_1:
	.byte $00, SoundEngine::CMD::Instrument, 7, SoundEngine::CMD::Wait, $0B, $04, SoundEngine::CMD::Wait, $0B, $00, SoundEngine::CMD::Wait, $0B, $04, SoundEngine::CMD::Wait, $1B

song_0_frameList_noise_2:
	.byte $04, SoundEngine::CMD::Instrument, 7, SoundEngine::CMD::Wait, $09, $05, SoundEngine::CMD::Instrument, 22, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $34

song_0_order_pulseA:
	.byte 0, 1
song_0_order_pulseB:
	.byte 0, 1
song_0_order_triangle:
	.byte 0, 1
song_0_order_noise:
	.byte 0, 1

song_1:
	.byte 64
	.byte 4
	.byte 150
	.byte 10

	.word song_1_frameList_pulseA
	.word song_1_frameList_pulseB
	.word song_1_frameList_triangle
	.word song_1_frameList_noise

	.byte 10

	.word song_1_order_pulseA
	.word song_1_order_pulseB
	.word song_1_order_triangle
	.word song_1_order_noise

song_1_frameList_pulseA:
	.word song_1_frameList_pulseA_0
	.word song_1_frameList_pulseA_1
	.word song_1_frameList_pulseA_2
	.word song_1_frameList_pulseA_3
	.word song_1_frameList_pulseA_4
	.word song_1_frameList_pulseA_5
	.word song_1_frameList_pulseA_6
	.word song_1_frameList_pulseA_7
	.word song_1_frameList_pulseA_8
	.word song_1_frameList_pulseA_9

song_1_frameList_pulseB:
	.word song_1_frameList_pulseB_0
	.word song_1_frameList_pulseB_1
	.word song_1_frameList_pulseB_2
	.word song_1_frameList_pulseB_3
	.word song_1_frameList_pulseB_4
	.word song_1_frameList_pulseB_5
	.word song_1_frameList_pulseB_6
	.word song_1_frameList_pulseB_7
	.word song_1_frameList_pulseB_8
	.word song_1_frameList_pulseB_9

song_1_frameList_triangle:
	.word song_1_frameList_triangle_0
	.word song_1_frameList_triangle_1
	.word song_1_frameList_triangle_2
	.word song_1_frameList_triangle_3
	.word song_1_frameList_triangle_4
	.word song_1_frameList_triangle_5
	.word song_1_frameList_triangle_6
	.word song_1_frameList_triangle_7
	.word song_1_frameList_triangle_8
	.word song_1_frameList_triangle_9

song_1_frameList_noise:
	.word song_1_frameList_noise_0
	.word song_1_frameList_noise_1
	.word song_1_frameList_noise_2
	.word song_1_frameList_noise_3
	.word song_1_frameList_noise_4
	.word song_1_frameList_noise_5
	.word song_1_frameList_noise_6
	.word song_1_frameList_noise_7
	.word song_1_frameList_noise_8
	.word song_1_frameList_noise_9

song_1_frameList_pulseA_0:
	.byte SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $09

song_1_frameList_pulseA_1:
	.byte SoundEngine::CMD::Wait, $06, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $11, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $21

song_1_frameList_pulseA_2:
	.byte SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $11

song_1_frameList_pulseA_3:
	.byte SoundEngine::CMD::Instrument, 21, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C6, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $11

song_1_frameList_pulseA_4:
	.byte SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $11

song_1_frameList_pulseA_5:
	.byte SoundEngine::CMD::Instrument, 21, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C6, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $11

song_1_frameList_pulseA_6:
	.byte SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $11

song_1_frameList_pulseA_7:
	.byte SoundEngine::CMD::Instrument, 16, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $07, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::G4, SoundEngine::Note::Gs4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::C5, SoundEngine::CMD::Halt, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D4, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $06, SoundEngine::CMD::Instrument, 9, SoundEngine::Note::Cs4, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $14

song_1_frameList_pulseA_8:
	.byte SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds6, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::Ds6, SoundEngine::CMD::Wait, $10

song_1_frameList_pulseA_9:
	.byte SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C6, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $11

song_1_frameList_pulseB_0:
	.byte SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $3F

song_1_frameList_pulseB_1:
	.byte SoundEngine::CMD::Wait, $0C, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::Ds5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::Ds5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::As4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::As5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::F4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::F5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::G4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::G5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::As4, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::As5, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::C5, SoundEngine::CMD::Instrument, 21, SoundEngine::Note::C6, SoundEngine::CMD::Wait, $20

song_1_frameList_pulseB_2:
	.byte SoundEngine::CMD::Instrument, 6, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 6, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $13

song_1_frameList_pulseB_3:
	.byte SoundEngine::CMD::Instrument, 6, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 6, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $13

song_1_frameList_pulseB_4:
	.byte SoundEngine::CMD::Instrument, 6, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 6, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $13

song_1_frameList_pulseB_5:
	.byte SoundEngine::CMD::Instrument, 6, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 6, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 15, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $14

song_1_frameList_pulseB_6:
	.byte SoundEngine::CMD::Instrument, 17, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $07, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::Cs4, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $06, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::B4, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $06, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $0C, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds6, SoundEngine::CMD::Wait, $08

song_1_frameList_pulseB_7:
	.byte SoundEngine::CMD::Instrument, 17, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $07, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::E4, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G4, SoundEngine::CMD::Halt, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $03, SoundEngine::Note::Fs3, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $06, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $14

song_1_frameList_pulseB_8:
	.byte SoundEngine::CMD::Instrument, 17, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $07, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::Cs4, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $06, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D5, SoundEngine::Note::Ds5, SoundEngine::CMD::Wait, $06, SoundEngine::Note::D5, SoundEngine::CMD::Wait, $15

song_1_frameList_pulseB_9:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 14, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $39

song_1_frameList_triangle_0:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $04

song_1_frameList_triangle_1:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 18, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $09, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $1F

song_1_frameList_triangle_2:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $04

song_1_frameList_triangle_3:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $04

song_1_frameList_triangle_4:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $04

song_1_frameList_triangle_5:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $04

song_1_frameList_triangle_6:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $11

song_1_frameList_triangle_7:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $11

song_1_frameList_triangle_8:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_1_frameList_triangle_9:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_1_frameList_noise_0:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01

song_1_frameList_noise_1:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $0D, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $1C

song_1_frameList_noise_2:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $05

song_1_frameList_noise_3:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $05

song_1_frameList_noise_4:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $05

song_1_frameList_noise_5:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $05

song_1_frameList_noise_6:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_1_frameList_noise_7:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_1_frameList_noise_8:
	.byte $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $01, $0C, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_1_frameList_noise_9:
	.byte SoundEngine::CMD::Wait, $40

song_1_order_pulseA:
	.byte 0, 1, 2, 3, 2, 5, 6, 7, 8, 9
song_1_order_pulseB:
	.byte 0, 1, 2, 2, 4, 5, 6, 7, 8, 9
song_1_order_triangle:
	.byte 0, 1, 0, 3, 0, 3, 6, 7, 8, 9
song_1_order_noise:
	.byte 0, 1, 2, 2, 2, 2, 6, 6, 6, 9

song_2:
	.byte 64
	.byte 5
	.byte 150
	.byte 7

	.word song_2_frameList_pulseA
	.word song_2_frameList_pulseB
	.word song_2_frameList_triangle
	.word song_2_frameList_noise

	.byte 9

	.word song_2_order_pulseA
	.word song_2_order_pulseB
	.word song_2_order_triangle
	.word song_2_order_noise

song_2_frameList_pulseA:
	.word song_2_frameList_pulseA_0
	.word song_2_frameList_pulseA_1
	.word song_2_frameList_pulseA_2
	.word song_2_frameList_pulseA_3
	.word song_2_frameList_pulseA_4
	.word song_2_frameList_pulseA_5
	.word song_2_frameList_pulseA_6

song_2_frameList_pulseB:
	.word song_2_frameList_pulseB_0
	.word song_2_frameList_pulseB_1
	.word song_2_frameList_pulseB_2
	.word song_2_frameList_pulseB_3
	.word song_2_frameList_pulseB_4
	.word song_2_frameList_pulseB_5
	.word song_2_frameList_pulseB_6

song_2_frameList_triangle:
	.word song_2_frameList_triangle_0
	.word song_2_frameList_triangle_1
	.word song_2_frameList_triangle_2
	.word song_2_frameList_triangle_3
	.word song_2_frameList_triangle_4
	.word song_2_frameList_triangle_5
	.word song_2_frameList_triangle_6

song_2_frameList_noise:
	.word song_2_frameList_noise_0
	.word song_2_frameList_noise_1
	.word song_2_frameList_noise_2
	.word song_2_frameList_noise_3
	.word song_2_frameList_noise_4
	.word song_2_frameList_noise_5
	.word song_2_frameList_noise_6

song_2_frameList_pulseA_0:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $17, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::F2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $03

song_2_frameList_pulseA_1:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $0F, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $03

song_2_frameList_pulseA_2:
	.byte SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $07, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $02, SoundEngine::Note::Ds3, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $31

song_2_frameList_pulseA_3:
	.byte SoundEngine::CMD::Instrument, 7, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G3, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $04, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $0D, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::Note::B2, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G2, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D2, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $02

song_2_frameList_pulseA_4:
	.byte SoundEngine::CMD::Instrument, 7, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::Fs3, SoundEngine::CMD::Halt, SoundEngine::Note::Fs3, SoundEngine::CMD::Halt, SoundEngine::Note::Fs3, SoundEngine::CMD::Halt, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $0D, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::F4, SoundEngine::Note::Fs4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::D4, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G3, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $04, SoundEngine::Note::Fs3, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $02

song_2_frameList_pulseA_5:
	.byte SoundEngine::CMD::Instrument, 7, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::Fs3, SoundEngine::CMD::Halt, SoundEngine::Note::Fs3, SoundEngine::CMD::Halt, SoundEngine::Note::Fs3, SoundEngine::CMD::Halt, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $0D, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 7, SoundEngine::Note::F4, SoundEngine::Note::Fs4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::D4, SoundEngine::Note::Ds4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G3, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $04, SoundEngine::Note::Fs3, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $02

song_2_frameList_pulseA_6:
	.byte SoundEngine::CMD::Instrument, 7, SoundEngine::Note::B3, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G3, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $04, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $0D, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::Note::B2, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G2, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $04, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D2, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $02

song_2_frameList_pulseB_0:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $17, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $03

song_2_frameList_pulseB_1:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $0F, SoundEngine::CMD::Instrument, 18, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01

song_2_frameList_pulseB_2:
	.byte SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $03, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $02, SoundEngine::Note::F3, SoundEngine::Note::F3, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $28

song_2_frameList_pulseB_3:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 18, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01

song_2_frameList_pulseB_4:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $0D, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Fs4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $03

song_2_frameList_pulseB_5:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $0D, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Fs4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::As4, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $03

song_2_frameList_pulseB_6:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Ds2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 20, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 18, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 11, SoundEngine::Note::Fs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A2, SoundEngine::CMD::Wait, $05, SoundEngine::Note::As2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::F4, SoundEngine::CMD::Wait, $01

song_2_frameList_triangle_0:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::D3, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03

song_2_frameList_triangle_1:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::F3, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $03

song_2_frameList_triangle_2:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $35

song_2_frameList_triangle_3:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::F3, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $03

song_2_frameList_triangle_4:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::D3, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03

song_2_frameList_triangle_5:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::D3, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03

song_2_frameList_triangle_6:
	.byte SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::F3, SoundEngine::CMD::Instrument, 19, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D3, SoundEngine::CMD::Wait, $01, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::C2, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $01, SoundEngine::Note::D2, SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 1, SoundEngine::Note::C5, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 0, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::Ds3, SoundEngine::CMD::Wait, $03

song_2_frameList_noise_0:
	.byte $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $05, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $02

song_2_frameList_noise_1:
	.byte $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $05, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $02

song_2_frameList_noise_2:
	.byte $0D, SoundEngine::CMD::Instrument, 2, $0D, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $01, $0D, $0D, $0D, $0D, $09, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $09, SoundEngine::CMD::Wait, $01, $04, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $07, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $20

song_2_frameList_noise_3:
	.byte $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $05, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $02

song_2_frameList_noise_4:
	.byte $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $05, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $02

song_2_frameList_noise_5:
	.byte $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $05, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $02

song_2_frameList_noise_6:
	.byte $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, $0D, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $03, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0A, SoundEngine::CMD::Wait, $05, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Wait, $01, $0D, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $01, $03, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $04, SoundEngine::CMD::Halt, SoundEngine::CMD::Wait, $02

song_2_order_pulseA:
	.byte 2, 0, 1, 0, 1, 4, 3, 5, 6
song_2_order_pulseB:
	.byte 2, 0, 1, 0, 1, 4, 3, 5, 6
song_2_order_triangle:
	.byte 2, 0, 1, 0, 1, 4, 3, 5, 6
song_2_order_noise:
	.byte 2, 0, 1, 0, 1, 4, 3, 5, 6

song_3:
	.byte 64
	.byte 6
	.byte 150
	.byte 7

	.word song_3_frameList_pulseA
	.word song_3_frameList_pulseB
	.word song_3_frameList_triangle
	.word song_3_frameList_noise

	.byte 5

	.word song_3_order_pulseA
	.word song_3_order_pulseB
	.word song_3_order_triangle
	.word song_3_order_noise

song_3_frameList_pulseA:
	.word song_3_frameList_pulseA_0
	.word song_3_frameList_pulseA_1
	.word song_3_frameList_pulseA_2
	.word song_3_frameList_pulseA_3
	.word song_3_frameList_pulseA_4
	.word song_3_frameList_pulseA_5
	.word song_3_frameList_pulseA_6

song_3_frameList_pulseB:
	.word song_3_frameList_pulseB_0
	.word song_3_frameList_pulseB_1
	.word song_3_frameList_pulseB_2
	.word song_3_frameList_pulseB_3
	.word song_3_frameList_pulseB_4
	.word song_3_frameList_pulseB_5
	.word song_3_frameList_pulseB_6

song_3_frameList_triangle:
	.word song_3_frameList_triangle_0
	.word song_3_frameList_triangle_1
	.word song_3_frameList_triangle_2
	.word song_3_frameList_triangle_3
	.word song_3_frameList_triangle_4
	.word song_3_frameList_triangle_5
	.word song_3_frameList_triangle_6

song_3_frameList_noise:
	.word song_3_frameList_noise_0
	.word song_3_frameList_noise_1
	.word song_3_frameList_noise_2
	.word song_3_frameList_noise_3
	.word song_3_frameList_noise_4
	.word song_3_frameList_noise_5
	.word song_3_frameList_noise_6

song_3_frameList_pulseA_0:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_pulseA_1:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_pulseA_2:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_pulseA_3:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_pulseA_4:
	.byte SoundEngine::CMD::Wait, $40

song_3_frameList_pulseA_5:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_pulseA_6:
	.byte SoundEngine::CMD::Instrument, 11, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_pulseB_0:
	.byte SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 17, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $0D

song_3_frameList_pulseB_1:
	.byte SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 17, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $0D

song_3_frameList_pulseB_2:
	.byte SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 17, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $0D

song_3_frameList_pulseB_3:
	.byte SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 17, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $0D

song_3_frameList_pulseB_4:
	.byte SoundEngine::CMD::Wait, $40

song_3_frameList_pulseB_5:
	.byte SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 17, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::G4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $0D

song_3_frameList_pulseB_6:
	.byte SoundEngine::CMD::Wait, $03, SoundEngine::CMD::Instrument, 17, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $05, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Fs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $0D

song_3_frameList_triangle_0:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $17, SoundEngine::Note::G3, SoundEngine::CMD::Wait, $27

song_3_frameList_triangle_1:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $17, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $27

song_3_frameList_triangle_2:
	.byte SoundEngine::CMD::Instrument, 4, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $17, SoundEngine::Note::As3, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $0A, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $1B

song_3_frameList_triangle_3:
	.byte SoundEngine::CMD::Instrument, 4, SoundEngine::Note::F3, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::E4, SoundEngine::CMD::Wait, $1B

song_3_frameList_triangle_4:
	.byte SoundEngine::CMD::Wait, $40

song_3_frameList_triangle_5:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $17, SoundEngine::Note::As3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 4, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $09, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::D4, SoundEngine::CMD::Wait, $1B

song_3_frameList_triangle_6:
	.byte SoundEngine::CMD::Instrument, 5, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $01, SoundEngine::CMD::Instrument, 4, SoundEngine::Note::C4, SoundEngine::CMD::Wait, $09, SoundEngine::CMD::Instrument, 5, SoundEngine::Note::A3, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::B3, SoundEngine::CMD::Wait, $0B, SoundEngine::Note::E3, SoundEngine::CMD::Wait, $05, SoundEngine::Note::Gs3, SoundEngine::CMD::Wait, $15

song_3_frameList_noise_0:
	.byte $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $01, $0F, SoundEngine::CMD::Wait, $10

song_3_frameList_noise_1:
	.byte $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $01, $0F, SoundEngine::CMD::Wait, $10

song_3_frameList_noise_2:
	.byte $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0B, SoundEngine::CMD::Instrument, 3, SoundEngine::CMD::Wait, $02, SoundEngine::CMD::Skip, $00, SoundEngine::CMD::Wait, $34

song_3_frameList_noise_3:
	.byte $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $01, $0F, SoundEngine::CMD::Wait, $10

song_3_frameList_noise_4:
	.byte $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $00, SoundEngine::CMD::Instrument, 0, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $02, $05, SoundEngine::CMD::Instrument, 22, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Instrument, 2, SoundEngine::CMD::Wait, $01, $0F, $0F, SoundEngine::CMD::Wait, $02, $0F, SoundEngine::CMD::Wait, $01, $0F, SoundEngine::CMD::Jump, $00, SoundEngine::CMD::Wait, $10

song_3_frameList_noise_5:
	.byte SoundEngine::CMD::Wait, $40

song_3_frameList_noise_6:
	.byte SoundEngine::CMD::Wait, $40

song_3_order_pulseA:
	.byte 4, 0, 1, 5, 6
song_3_order_pulseB:
	.byte 4, 0, 1, 5, 6
song_3_order_triangle:
	.byte 4, 0, 1, 5, 6
song_3_order_noise:
	.byte 2, 0, 1, 3, 4

SongList_Length = 4
MacroList_Length = 29
InstrumentList_Length = 23
