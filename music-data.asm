; asmsyntax=ca65

SongMeta:
    .word SongList
    .word InstrumentList
    .word InstrumentMacroList

SongList:
    .word SongA
    .word SongB

SongList_Length = (* - SongList) / 2

SongA:
    .byte 64    ; Rows
    ; Speed is ticks per row.  Tempo is how fast those ticks happen.
    .byte 6     ; Speed
    .byte 150   ; Tempo
    .byte 1     ; Frames

    .word SongA_FrameList_PulseA
    .word SongA_FrameList_PulseB
    .word SongA_FrameList_Triangle
    .word SongA_FrameList_Noise

    .word SongA_Order_PulseA
    .word SongA_Order_PulseB
    .word SongA_Order_Triangle
    .word SongA_Order_Noise

SongA_Order_PulseA:
    .byte 0, 1, 2, 2, 3

SongA_FrameList_PulseA:
    .word sapa_0
    .word sapa_1
    .word sapa_2
    .word sapa_3
    .word sapa_2

SongA_FrameList_PulseB:
    .word sapb_0
    .word sapb_1
    .word sapb_2
    .word sapb_3

SongA_FrameList_Triangle:
    .word satr_0
    .word satr_1
    .word satr_2
    .word satr_3

SongA_FrameList_Noise:
    .word sano_0
    .word sano_1
    .word sano_2
    .word sano_3

sapa_0:
sapa_1:
sapa_2:
sapa_3:
sapb_0:
sapb_1:
sapb_2:
sapb_3:
satr_0:
satr_1:
satr_2:
satr_3:
sano_0:
sano_1:
sano_2:
sano_3:

SongB:
    .word SongB_FrameList_PulseA
    .word SongB_FrameList_PulseB
    .word SongB_FrameList_Triangle
    .word SongB_FrameList_Noise

SongB_FrameList_PulseA:
    .word sbpa_0
    .word sbpa_1
    .word sbpa_2
    .word sbpa_3

SongB_FrameList_PulseB:
    .word sbpb_0
    .word sbpb_1
    .word sbpb_2
    .word sbpb_3

SongB_FrameList_Triangle:
    .word sbtr_0
    .word sbtr_1
    .word sbtr_2
    .word sbtr_3

SongB_FrameList_Noise:
    .word sbno_0
    .word sbno_1
    .word sbno_2
    .word sbno_3

sbpa_0:
sbpa_1:
sbpa_2:
sbpa_3:
sbpb_0:
sbpb_1:
sbpb_2:
sbpb_3:
sbtr_0:
sbtr_1:
sbtr_2:
sbtr_3:
sbno_0:
sbno_1:
sbno_2:
sbno_3:

InstrumentList:
    .word inst0
InstrumentCount = (* - InstrumentList) / 2

inst0:
    ; main
    .byte 0 ; Volume macro
    .byte 255 ; Arpeggio
    .byte 255 ; Pitch
    .byte 255 ; Hi-Pitch
    .byte 0 ; Duty

InstrumentMacroList:
    .word im0
    .word im1
    .word im2
    .word im3
    .word im4

im0:
    .byte 0 ; Loop
    .byte 1 ; Release
    .byte 7 ; Length
    .byte 6, 6, 5, 4, 3, 2, 0

im1:
    .byte 0 ; Loop
    .byte 1 ; Release
    .byte 7 ; Length
    .byte 6, 6, 5, 4, 3, 2, 0

im2:
    .byte 0 ; Loop
    .byte 1 ; Release
    .byte 7 ; Length
    .byte 6, 6, 5, 4, 3, 2, 0

im3:
    .byte 0 ; Loop
    .byte 1 ; Release
    .byte 7 ; Length
    .byte 6, 6, 5, 4, 3, 2, 0

im4:
    .byte 0 ; Loop
    .byte 1 ; Release
    .byte 7 ; Length
    .byte 6, 6, 5, 4, 3, 2, 0
