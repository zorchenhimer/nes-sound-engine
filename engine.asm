; asmsyntax=ca65

.scope SoundEngine

.enum CMD
    ; notes from 0 - 127
    Arpeggio            = 0 | $80
    SlideUp
    SlideDown
    AutomaticPortamento
    Vibrato
    Tremolo
    VolumeSlide
    Jump
    Halt
    Skip
    SpeedTempo
    NoteDelay
    HardwareSweepUp
    HardwareSweepDown
    FinePitch
    NoteSlideUp
    NoteSlideDown
    DelayedCut
    TimbreControl
    Release
    Instrument
    Wait

    ; DPCM
    DPCM_Pitch
    DPCM_Retrigger
    DPCM_SampleOffset
    DeltaCounter

    Disable

    Volume = $C0    ; bottom nibble will be volume value
.endenum

.include "engine_ram.asm"
.include "notes.i" ; TODO PAL

; Turn things on
; Pointer to SongMeta in PointerA
SoundInit:
    ; Disable length counter
    lda #$7F
    sta PulseA_DutyVol
    sta PulseB_DutyVol

    ; Clear Buffers
    lda #$08    ; disable sweep and set the negate flag
    sta PulseA_Sweep
    sta PulseB_Sweep

    lda #0
    sta PulseA_DutyVol
    sta PulseA_TimerLo
    sta PulseA_TimerHi

    sta PulseB_DutyVol
    sta PulseB_TimerLo
    sta PulseB_TimerHi

    sta Triangle_Counter
    sta Triangle_TimerLo
    sta Triangle_TimerHi

    sta Noise_Volume
    sta Noise_Period
    sta Noise_Counter

    ; DMC channel.  Unused, just turn everything off.
    sta $4010
    sta $4011
    sta $4012
    sta $4013

    ;jsr resetChannelStates

    ; Load this stuff up so we don't have to do it
    ; every time the song or instrument changes.
    ldy #0
    lda (PointerA), y
    sta SongListPointer+0
    iny
    lda (PointerA), y
    sta SongListPointer+1

    iny
    lda (PointerA), y
    sta InstrumentListPointer+0
    iny
    lda (PointerA), y
    sta InstrumentListPointer+1

    iny
    lda (PointerA), y
    sta MacroListPointer+0
    iny
    lda (PointerA), y
    sta MacroListPointer+1

    ; Enable everything (make this configurable?)
    ;lda #Enable::PulseA | Enable::PulseB | Enable::Triangle | Enable::Noise
    ;sta $4015
    rts

resetChannelStates:
    ; Clear out all the channel states.  This includes the loaded
    ; instruments for each channel.
    LoopCount = .sizeof(ChannelState) * 4
    .out .sprintf("LoopCount: %d", LoopCount)
    lda #0
    ldx #0
:
    sta PulseA_State, x
    inx
    cpx #LoopCount
    bne :-

    sta Global::OrderIdx
    rts

; Index to song in A
LoadSong:
    tax
    cmp #SongList_Length
    bcc :+
    brk ; Song ID out of range
:

    lda #0
    sta Global::OrderIdx
    sta Global::CurrentRow
    sta Global::Tick

    ; Get the song list pointer
    ldy #0
    lda (SongListPointer), y
    sta PointerA+0
    iny
    lda (SongListPointer), y
    sta PointerA+1

    ; PointerA is a pointer to the song metadata
    txa
    tay
    lda (PointerA), y
    sta Global::Rows

    iny
    lda (PointerA), y
    sta Global::Speed

    iny
    lda (PointerA), y
    sta Global::Tempo

    jsr resetChannelStates

    iny ; icrement past frame length
    iny
    lda (PointerA), y
    sta PulseA_Pointers+ChannelPointers::Frames+0
    iny
    lda (PointerA), y
    sta PulseA_Pointers+ChannelPointers::Frames+1

    iny
    lda (PointerA), y
    sta PulseB_Pointers+ChannelPointers::Frames+0
    iny
    lda (PointerA), y
    sta PulseB_Pointers+ChannelPointers::Frames+1

    iny
    lda (PointerA), y
    sta Triangle_Pointers+ChannelPointers::Frames+0
    iny
    lda (PointerA), y
    sta Triangle_Pointers+ChannelPointers::Frames+1

    iny
    lda (PointerA), y
    sta Noise_Pointers+ChannelPointers::Frames+0
    iny
    lda (PointerA), y
    sta Noise_Pointers+ChannelPointers::Frames+1

    iny
    lda (PointerA), y
    sta Global::OrderIdxMax

    iny
    lda (PointerA), y
    sta PulseA_Pointers+ChannelPointers::Orders+0
    iny
    lda (PointerA), y
    sta PulseA_Pointers+ChannelPointers::Orders+1

    iny
    lda (PointerA), y
    sta PulseB_Pointers+ChannelPointers::Orders+0
    iny
    lda (PointerA), y
    sta PulseB_Pointers+ChannelPointers::Orders+1

    iny
    lda (PointerA), y
    sta Triangle_Pointers+ChannelPointers::Orders+0
    iny
    lda (PointerA), y
    sta Triangle_Pointers+ChannelPointers::Orders+1

    iny
    lda (PointerA), y
    sta Noise_Pointers+ChannelPointers::Orders+0
    iny
    lda (PointerA), y
    sta Noise_Pointers+ChannelPointers::Orders+1

    jsr LoadOrder
    nop
    rts

NextOrder:
    ; Go to next frame in order
    inc Global::OrderIdx
    lda Global::OrderIdx
    cmp Global::OrderIdxMax
    bcc :+
    lda #0
    sta Global::OrderIdx
:

; Looks at a given order and loads the appropriate frames
LoadOrder:
    ; for each channel, load the appropriate frame

    lda #<PulseA_Pointers
    sta PointerA+0
    lda #>PulseA_Pointers
    sta PointerA+1

    lda #<PulseA_State
    sta PointerB+0
    lda #>PulseA_State
    sta PointerB+1
    jsr @loadOrder

    lda #<PulseB_Pointers
    sta PointerA+0
    lda #>PulseB_Pointers
    sta PointerA+1

    lda #<PulseB_State
    sta PointerB+0
    lda #>PulseB_State
    sta PointerB+1
    jsr @loadOrder

    lda #<Triangle_Pointers
    sta PointerA+0
    lda #>Triangle_Pointers
    sta PointerA+1

    lda #<Triangle_State
    sta PointerB+0
    lda #>Triangle_State
    sta PointerB+1
    jsr @loadOrder

    lda #<Noise_Pointers
    sta PointerA+0
    lda #>Noise_Pointers
    sta PointerA+1

    lda #<Noise_State
    sta PointerB+0
    lda #>Noise_State
    sta PointerB+1
    jsr @loadOrder
    rts

@loadOrder:
    ; Load pointer to order list
    ldy #ChannelPointers::Orders
    lda (PointerA), y
    sta PointerOrder+0
    iny
    lda (PointerA), y
    sta PointerOrder+1

    ; load frame index
    ldy Global::OrderIdx
    lda (PointerOrder), y

    ldy #ChannelState::CurrentFrame
    sta (PointerB), y

    lda #0
    ldy #ChannelState::ReadOffset
    sta (PointerB), y
    rts

; Process sounds for the this frame.
; TODO: frame/order progression
SoundProcess:
    ; Clear buffers
    lda #0
    sta PulseA_DutyVol
    sta PulseA_Sweep
    sta PulseA_TimerLo
    sta PulseA_TimerHi

    sta PulseB_DutyVol
    sta PulseB_Sweep
    sta PulseB_TimerLo
    sta PulseB_TimerHi

    sta Triangle_Counter
    sta Triangle_TimerLo
    sta Triangle_TimerHi

    sta Noise_Volume
    sta Noise_Period
    sta Noise_Counter

    lda Global::Tick
    beq :+
    jmp @doSfx
:

    ; Row read tick rate
    lda #15
    sta Global::Tick

    ;
    ; Pulse A
    ;
    lda #<PulseA_Pointers
    sta PointerA+0
    lda #>PulseA_Pointers
    sta PointerA+1

    lda #<PulseA_State
    sta PointerB+0
    lda #>PulseA_State
    sta PointerB+1

    lda #<PulseA_TimerLo
    sta PointerD+0
    lda #>PulseA_TimerLo
    sta PointerD+1

    jsr processChannel

    ;
    ; Pulse B
    ;
    lda #<PulseB_Pointers
    sta PointerA+0
    lda #>PulseB_Pointers
    sta PointerA+1

    lda #<PulseB_State
    sta PointerB+0
    lda #>PulseB_State
    sta PointerB+1

    lda #<PulseB_TimerLo
    sta PointerD+0
    lda #>PulseB_TimerLo
    sta PointerD+1

    jsr processChannel

    ;
    ; Triangle
    ;
    lda #<Triangle_Pointers
    sta PointerA+0
    lda #>Triangle_Pointers
    sta PointerA+1

    lda #<Triangle_State
    sta PointerB+0
    lda #>Triangle_State
    sta PointerB+1

    lda #<Triangle_TimerLo
    sta PointerD+0
    lda #>Triangle_TimerLo
    sta PointerD+1

    jsr processChannel

    ;
    ; Noise
    ;
    lda #<Noise_Pointers
    sta PointerA+0
    lda #>Noise_Pointers
    sta PointerA+1

    lda #<Noise_State
    sta PointerB+0
    lda #>Noise_State
    sta PointerB+1

    lda #<Noise_Volume
    sta PointerD+0
    lda #>Noise_Volume
    sta PointerD+1

    jsr processChannelNoise

    inc Global::CurrentRow
    lda Global::CurrentRow
    cmp Global::Rows

    bcc :+
    jsr NextOrder
:

;;

@doInstruments:
    ; do instrument stuff


    ; TODO: music before SFX
@doSfx:
;    ; Check if an SFX is playing
;    bit SfxId
;    bpl @noSfx
;
;    ; Check if it's time to do something
;    lda Sfx_State + SfxState::Ticks
;    bne @decTick
;
;    ; Reset the ticks till next event
;    lda Sfx_State + SfxState::TickRate
;    sta Sfx_State + SfxState::Ticks
;
;    ; Read the next byte of data
;    ldy Sfx_State + SfxState::Offset
;    inc Sfx_State + SfxState::Offset
;    lda (Sfx_State + SfxState::Data), y
;    bmi @command
;    ; Play a note
;    ; TODO: channel shit
;
;    tax
;    lda NoteTable, x
;    sta PulseA_TimerLo
;    lda NoteTable+1, x
;    and #5
;    sta PulseA_TimerHi
;
;    lda Sfx_State + SfxState::Volume
;    sta PulseA_DutyVol
;@command:
;    and #$7F
;    bne :+
;    ; Disable
;    ; Clear sfx state
;    lda #0
;    sta SfxId
;    sta Sfx_State + SfxState::Length
;    sta Sfx_State + SfxState::Ticks
;    sta Sfx_State + SfxState::TickRate
;    sta Sfx_State + SfxState::Data+0
;    sta Sfx_State + SfxState::Data+1
;    jmp @noSfx
;:
;
;    jmp @noSfx

;; It's not time to do something
;@decTick:
;    dec Sfx_State + SfxState::Ticks
@noSfx:
    rts

; Increment the data pointer and return
;incDataPointer:
;    ldy #ChannelState::ReadOffset
;    inc (PointerB), y
;    rts

processChannelNoise:
    rts

incrementChannel:
    ; increment data pointer and fall through
    ; to processChannel
    ldy #ChannelState::ReadOffset
    lda (PointerB), y
    clc
    adc #1
    sta (PointerB), y

; SongMeta
;   SongList
;       song_0 ; Title Screen
;           [data]
;           song_0_frameList_pulseA
;               song_0_frameList_pulseA_0
;                   [data]
;               song_0_frameList_pulseA_1
;                   [data]
;           song_0_frameList_pulseB
;               song_0_frameList_pulseB_0
;                   [data]
;               song_0_frameList_pulseB_1
;                   [data]
;           song_0_frameList_triangle
;               song_0_frameList_triangle_0
;                   [data]
;               song_0_frameList_triangle_1
;                   [data]
;           song_0_frameList_noise
;       song_1 ; Level Music 1
;   InstrumentList
;       inst_0
;           [data]
;       inst_1
;           [data]
;   InstrumentMacroList
;       macro_0_0
;           [data]
;       macro_0_1
;           [data]

; PointerA points to the channel's pointers in ZP
; PointerB points to ChannelState data structure
; PointerD points to the channel's TimerLo buffer (w/ the others following)
processChannel:
    ; Read a row
    ; If note, play it
    ; else, act on command

    ; Check for wait. if !zero, decrement and return
    ldy #ChannelState::Wait
    lda (PointerB), y
    beq :+
    sec
    sbc #1
    sta (PointerB), y
    rts
:

    ldy #ChannelState::ReadOffset
    lda (PointerB), y
    sta Offset

    ; Get Frame list
    ldy #ChannelPointers::Frames
    lda (PointerA), y ; points to frameList
    sta PointerC+0
    iny
    lda (PointerA), y
    sta PointerC+1

    ldy #ChannelState::CurrentFrame
    lda (PointerB), y
    asl a ; index -> offset
    tay

    lda (PointerC), y
    sta PointerFrame+0
    iny
    lda (PointerC), y
    sta PointerFrame+1

    ; PointerC now points to the frame data
    ldy Offset
    lda (PointerFrame), y   ; finally read the data
    sta Data

    bmi @doCommand
    ; Reset instrument
    lda #0
    ldy #ChannelState::Tick
    sta (PointerB), y

    ; Store note Hi value in buffer
    ldx Data
    lda NoteTable, x
    ldy #0
    sta (PointerD), y

    ; Store note Lo value in buffer
    inx
    lda NoteTable, x
    iny
    sta (PointerD), y

    ; TODO: Do instrument stuff

    rts

@doCommand:
    lda #0
    bit Data
    bvc @cmdLookup
    ; V is set, it's a Volume command
    lda Data
    and #$0F ; volume value in low nibble
    ora #$10 ; turn on constant volume
    ldy #2
    sta (PointerD), y
    jmp incrementChannel

@cmdLookup:
    lda Data
    and #$7F
    tax
    lda commandFunctions, x
    sta PointerFn+0
    inx
    lda commandFunctions, x
    sta PointerFn+1

    jmp (PointerFn)

commandFunctions:
    .word cmdFnArpeggio
    .word cmdFnSlideUp
    .word cmdFnSlideDown
    .word cmdFnAutomaticPortamento
    .word cmdFnVibrato
    .word cmdFnTremolo
    .word cmdFnVolumeSlide
    .word cmdFnJump
    .word cmdFnHalt
    .word cmdFnSkip
    .word cmdFnSpeedTempo
    .word cmdFnNoteDelay
    .word cmdFnHardwareSweepUp
    .word cmdFnHardwareSweepDown
    .word cmdFnFinePitch
    .word cmdFnNoteSlideUp
    .word cmdFnNoteSlideDown
    .word cmdFnDelayedCut
    .word cmdFnTimbreControl
    .word cmdFnRelease
    .word cmdFnInstrument
    .word cmdFnWait
    .word cmdFnDPCM_Pitch
    .word cmdFnDPCM_Retrigger
    .word cmdFnDPCM_SampleOffset
    .word cmdFnDeltaCounter
    .word cmdFnDisable

cmdFnArpeggio:
    jmp incrementChannel
cmdFnSlideUp:
    jmp incrementChannel
cmdFnSlideDown:
    jmp incrementChannel
cmdFnAutomaticPortamento:
    jmp incrementChannel
cmdFnVibrato:
    jmp incrementChannel
cmdFnTremolo:
    jmp incrementChannel
cmdFnVolumeSlide:
    jmp incrementChannel
cmdFnJump:
    jmp incrementChannel
cmdFnSkip:
    ; Get argument
    iny
    lda (PointerFrame), y
    beq :+
    brk ; Skip argument non-zero!
:
    jmp NextOrder

cmdFnSpeedTempo:
    jmp incrementChannel
cmdFnNoteDelay:
    jmp incrementChannel
cmdFnHardwareSweepUp:
    jmp incrementChannel
cmdFnHardwareSweepDown:
    jmp incrementChannel
cmdFnFinePitch:
    jmp incrementChannel
cmdFnNoteSlideUp:
    jmp incrementChannel
cmdFnNoteSlideDown:
    jmp incrementChannel
cmdFnDelayedCut:
    jmp incrementChannel
cmdFnTimbreControl:
    jmp incrementChannel
cmdFnRelease:
    jmp incrementChannel

.enum insData
    Volume = 0
    Arpeggio
    Pitch
    HiPitch
    Duty
.endEnum

cmdFnInstrument:
    ; Get argument
    iny
    lda (PointerFrame), y
    asl a ; index -> offset
    tay

    lda (InstrumentListPointer), y
    sta PointerInstrument+0
    iny
    lda (InstrumentListPointer), y
    sta PointerInstrument+1

    ; Load macros
    ; Volume
    ldy #0
    lda (PointerInstrument), y
    asl a
    tay
    lda (MacroListPointer), y
    sta PointerMacro+0
    iny
    lda (MacroListPointer), y
    sta PointerMacro+1

    ldy #0
    lda (PointerMacro), y
    ldy #ChannelState::Instrument+Instrument::Volume+InstrumentMacro::Loop
    sta (PointerB), y

    ldy #1
    lda (PointerMacro), y
    ldy #ChannelState::Instrument+Instrument::Volume+InstrumentMacro::Release
    sta (PointerB), y

    ldy #2
    lda (PointerMacro), y
    ldy #ChannelState::Instrument+Instrument::Volume+InstrumentMacro::Length
    sta (PointerB), y

    ldy #3
    lda (PointerMacro), y
    ldy #ChannelState::Instrument+Instrument::Volume+InstrumentMacro::Pointer+0
    sta (PointerB), y

    ldy #4
    lda (PointerMacro), y
    ldy #ChannelState::Instrument+Instrument::Volume+InstrumentMacro::Pointer+1
    sta (PointerB), y

    ; TODO: the rest of the macros, lol

    jmp incrementChannel

cmdFnWait:
    ; Get argument
    iny
    lda (PointerFrame), y

    ; Store it
    ldy #ChannelState::Wait
    sta (PointerB), y

    ; save offset
    tya
    ldy #ChannelState::ReadOffset
    sta (PointerB), y
    rts

cmdFnDPCM_Pitch:
    jmp incrementChannel
cmdFnDPCM_Retrigger:
    jmp incrementChannel
cmdFnDPCM_SampleOffset:
    jmp incrementChannel
cmdFnDeltaCounter:
    jmp incrementChannel
cmdFnDisable:
    jmp incrementChannel
cmdFnHalt:
    brk ; TODO: stop all processing for current song
    ;jmp channelDone

; Write buffers to the APU
WriteBuffers:
    ; TODO: update flags?
    lda PulseA_DutyVol
    sta APU::PulseA_DutyVol
    lda PulseA_Sweep
    sta APU::PulseA_Sweep
    lda PulseA_TimerLo
    sta APU::PulseA_TimerLo
    lda PulseA_TimerHi
    sta APU::PulseA_TimerHi

    lda PulseB_DutyVol
    sta APU::PulseB_DutyVol
    lda PulseB_Sweep
    sta APU::PulseB_Sweep
    lda PulseB_TimerLo
    sta APU::PulseB_TimerLo
    lda PulseB_TimerHi
    sta APU::PulseB_TimerHi

    lda Triangle_Counter
    sta APU::Triangle_Counter
    lda Triangle_TimerLo
    sta APU::Triangle_TimerLo
    lda Triangle_TimerHi
    sta APU::Triangle_TimerHi

    lda Noise_Volume
    sta APU::Noise_Volume
    lda Noise_Period
    sta APU::Noise_Period
    lda Noise_Counter
    sta APU::Noise_Counter
    rts

PlaySfx:
    tax
    ora #$80
    sta SfxId

    ; Clear sfx state
    lda #0
    sta Sfx_State + SfxState::Length
    sta Sfx_State + SfxState::Ticks
    sta Sfx_State + SfxState::TickRate
    sta Sfx_State + SfxState::Data+0
    sta Sfx_State + SfxState::Data+1

    ; ID -> word offset
    txa
    asl a
    tax

    ; Load up poniter to metadata
    lda sfxTable, x
    sta PointerA
    lda sfxTable+1, x
    sta PointerA+1

    ; Read metadata
    ldy #0
    lda (PointerA), y
    sta Sfx_State + SfxState::Length

    iny
    lda (PointerA), y
    sta Sfx_State + SfxState::TickRate

    iny
    lda (PointerA), y
    sta Sfx_State + SfxState::Volume

    iny
    lda (PointerA), y
    sta Sfx_State + SfxState::Data+0
    iny
    lda (PointerA), y
    sta Sfx_State + SfxState::Data+1
    rts

; Pointer to channel data in PointerA
clearChannelState:
    ldy #6
    lda #0
:
    dey
    sta (PointerA), y
    bne :-
    rts

sfxTable:
    .word sfxA

SFX_COUNT = (* - sfxTable) / 2
.out .sprintf("SFX_COUNT: %d", SFX_COUNT)

sfxA_Data:
    .byte Note::C3, Note::D3, Note::E3, Note::F3, CMD::Disable

; Metadata
sfxA:
    .byte * - sfxA_Data
    .byte $08
    .byte $07
    ;.byte channels to use?
    .word sfxA_Data

;;;; Data format for SFX
; sfxMetaData:
;   .byte length of data
;   .byte frames per tick
;   .byte duty/volume
;   .word pointer to note/command data

.endscope

