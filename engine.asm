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

.macro clearBuffers
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
.endmacro

.include "engine_ram.asm"
.include "notes.i" ; TODO PAL

; Turn things on
; Pointer to SongMeta in PointerA
SoundInit:
    ; Disable length counter
    lda #$7F
    sta PulseA_DutyVol
    sta PulseB_DutyVol

    clearBuffers

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

    lda #EngineFlag::Ready
    sta EngineFlags

    ; Enable everything (make this configurable?)
    lda #Enable::PulseA | Enable::PulseB | Enable::Triangle | Enable::Noise
    ;lda #Enable::PulseA | Enable::PulseB
    sta $4015
    rts

resetChannelStates:
    ; Clear out all the channel states.  This includes the loaded
    ; instruments for each channel.
    ;LoopCount = (ChannelInstrumentsLength * 4) + ChannelStateLength
    ;.out .sprintf("LoopCount: %d", LoopCount)
    lda #0
    ldx #0
:
    sta ChannelStateStart, x
    inx
    cpx #ChannelStateLength
    bne :-

    sta Global::OrderId
    rts

; Index to song in A
LoadSong:
    tax
    cmp #SongList_Length
    bcc :+
    brk ; Song ID out of range
:

    lda #0
    sta Global::OrderId
    sta Global::CurrentRow

    ; Get the song list pointer
    txa
    asl a
    tay
    lda (SongListPointer), y
    sta PointerA+0
    iny
    lda (SongListPointer), y
    sta PointerA+1

    ; PointerA is a pointer to the song metadata
    ldy #0
    lda (PointerA), y
    sta Global::Rows

    iny
    lda (PointerA), y
    sta Global::Speed

    ; Don't wait after loading a song for the first tick
    ; Start at 1 because it's DEC'd before check
    lda #1
    sta Global::Tick

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
    sta Global::OrderIdMax

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

.macro loadOrder channelname
    ; Load pointer to order list
    ldy #ChannelPointers::Orders
    lda (PointerA), y
    sta PointerOrder+0
    iny
    lda (PointerA), y
    sta PointerOrder+1

    ; load frame index
    ldy Global::OrderId
    lda (PointerOrder), y
    sta .ident(.concat(channelname, "_State_CurrentFrame"))

    lda #0
    sta .ident(.concat(channelname, "_State_ReadOffset"))
    sta .ident(.concat(channelname, "_State_Wait"))

.endmacro

NextOrder:
    sta Global::CurrentRow

    ; Go to next frame in order
    inc Global::OrderId
    lda Global::OrderId
    cmp Global::OrderIdMax
    bcc :+
    lda #0
    sta Global::OrderId
:

; Looks at a given order and loads the appropriate frames
LoadOrder:
    ; for each channel, load the appropriate frame

    ;;
    ;; PulseA
    ;;
    lda #<PulseA_Pointers
    sta PointerA+0
    lda #>PulseA_Pointers
    sta PointerA+1
    loadOrder "PulseA"

    ;;
    ;; PulseB
    ;;
    lda #<PulseB_Pointers
    sta PointerA+0
    lda #>PulseB_Pointers
    sta PointerA+1
    loadOrder "PulseB"

    ;;
    ;; Triangle
    ;;
    lda #<Triangle_Pointers
    sta PointerA+0
    lda #>Triangle_Pointers
    sta PointerA+1
    loadOrder "Triangle"

    ;;
    ;; Noise
    ;;
    lda #<Noise_Pointers
    sta PointerA+0
    lda #>Noise_Pointers
    sta PointerA+1
    loadOrder "Noise"
    rts

.macro loadProcessVars channelName
    lda .ident(.concat(channelName, "_State_Wait"))
    sta Ch_Wait
    lda .ident(.concat(channelName, "_State_ReadOffset"))
    sta Offset
    lda .ident(.concat(channelName, "_State_Tick"))
    sta Ch_Tick
    lda .ident(.concat(channelName, "_State_CurrentFrame"))
    sta Ch_CurrentFrame
    lda .ident(.concat(channelName, "_Volume_Offset"))
    sta Ch_InstOffset
.endmacro

.macro saveProcessVars channelName
    lda Ch_Wait
    sta .ident(.concat(channelName, "_State_Wait"))
    lda Offset
    sta .ident(.concat(channelName, "_State_ReadOffset"))
    lda Ch_Tick
    sta .ident(.concat(channelName, "_State_Tick"))
    lda Ch_Ready
    ora .ident(.concat(channelName, "_Ready"))
    sta .ident(.concat(channelName, "_Ready"))
    lda Ch_Note
    sta .ident(.concat(channelName, "_State_LastNote"))

    lda Ch_InstOffset
    sta .ident(.concat(channelName, "_Volume_Offset"))
    lda Ch_Running
    sta .ident(.concat(channelName, "_Volume_Running"))

    lda Ch_InstId
    sta .ident(.concat(channelName, "_InstId"))
.endmacro

.macro loadInstrumentVars channelName
    lda .ident(.concat(channelName, "_State_LastNote"))
    sta Ch_Note
    lda .ident(.concat(channelName, "_Volume_Offset"))
    sta Ch_InstOffset
    lda .ident(.concat(channelName, "_Volume_Length"))
    sta Ch_Length
    lda .ident(.concat(channelName, "_Volume_Running"))
    sta Ch_Running


    lda .ident(.concat(channelName, "_Volume_Pointer"))+0
    sta PointerA+0
    lda .ident(.concat(channelName, "_Volume_Pointer"))+1
    sta PointerA+1
.endmacro

.macro saveInstrumentVars channelName
    lda Ch_InstOffset
    sta .ident(.concat(channelName, "_Volume_Offset"))
    lda Ch_Ready
    ora .ident(.concat(channelName, "_Ready"))
    sta .ident(.concat(channelName, "_Ready"))
.endmacro

; Process sounds for the this frame.
; TODO: frame/order progression
SoundProcess:
    lda EngineFlags
    and #EngineFlag::Ready
    bne :+
    jsr SoundInit
:

    clearBuffers

    dec Global::Tick
    lda Global::Tick
    beq :+
    ; it's not time to read the next row
    jmp @doInstruments
:
    ; Reset ticks
    ; Note/Command read rate
    lda Global::Speed
    sta Global::Tick

    lda EngineFlags
    bmi :+  ; EngineFlag:EnableSong
    jmp @doSfx
:

    lda GoToOrder
    beq :+
    and #$7F
    jsr NextOrder
    lda #0
    sta GoToOrder
:

    ;
    ; Pulse A
    ;
    lda #<PulseA_Pointers
    sta PointerA+0
    lda #>PulseA_Pointers
    sta PointerA+1

    lda #<PulseA_TimerLo
    sta PointerD+0
    lda #>PulseA_TimerLo
    sta PointerD+1

    loadProcessVars "PulseA"
    lda #0
    sta Ch_Id
    lda #<PulseA_InstId
    sta PointerDbg+0
    lda #>PulseA_InstId
    sta PointerDbg+1
    jsr processChannel
    saveProcessVars "PulseA"

    ;
    ; Pulse B
    ;
    lda #<PulseB_Pointers
    sta PointerA+0
    lda #>PulseB_Pointers
    sta PointerA+1

    lda #<PulseB_TimerLo
    sta PointerD+0
    lda #>PulseB_TimerLo
    sta PointerD+1

    loadProcessVars "PulseB"
    lda #1
    sta Ch_Id
    lda #<PulseB_InstId
    sta PointerDbg+0
    lda #>PulseB_InstId
    sta PointerDbg+1
    jsr processChannel
    saveProcessVars "PulseB"

    ;
    ; Triangle
    ;
    lda #<Triangle_Pointers
    sta PointerA+0
    lda #>Triangle_Pointers
    sta PointerA+1

    lda #<Triangle_TimerLo
    sta PointerD+0
    lda #>Triangle_TimerLo
    sta PointerD+1

    loadProcessVars "Triangle"
    lda #2
    sta Ch_Id
    lda #<Triangle_InstId
    sta PointerDbg+0
    lda #>Triangle_InstId
    sta PointerDbg+1
    jsr processChannel
    saveProcessVars "Triangle"

    ;
    ; Noise
    ;
    lda #<Noise_Pointers
    sta PointerA+0
    lda #>Noise_Pointers
    sta PointerA+1

    lda #<Noise_Period
    sta PointerD+0
    lda #>Noise_Period
    sta PointerD+1

    loadProcessVars "Noise"
    lda #3
    sta Ch_Id
    lda #<Noise_InstId
    sta PointerDbg+0
    lda #>Noise_InstId
    sta PointerDbg+1
    jsr processChannel
    saveProcessVars "Noise"

    inc Global::CurrentRow
    lda Global::CurrentRow
    cmp Global::Rows

    bcc :+
    lda #0
    jsr NextOrder
:

;;

@doInstruments:
    ; do instrument stuff
    loadInstrumentVars "PulseA"
    lda #<PulseA_DutyVol
    sta PointerD+0
    lda #>PulseA_DutyVol
    sta PointerD+1
    lda #0
    sta Ch_Id
    jsr processInstrument
    saveInstrumentVars "PulseA"

    loadInstrumentVars "PulseB"
    lda #<PulseB_DutyVol
    sta PointerD+0
    lda #>PulseB_DutyVol
    sta PointerD+1
    lda #1
    sta Ch_Id
    jsr processInstrument
    saveInstrumentVars "PulseB"

    ; TODO: music before SFX

@doSfx:
    lda EngineFlags
    bvs :+ ; EngineFlag::EnableSfx
    jmp @noSfx
:
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
    lda EngineFlags
    ora #EngineFlag::BufferReady
    sta EngineFlags
    rts

; Increment the data pointer and return
;incDataPointer:
;    ldy #ChannelState::ReadOffset
;    inc (PointerB), y
;    rts

; PointerA - VolumeMacro Pointer
; PointerD - DutyVolume buffer
processInstrument:
    ; verify running
    ; check offset against length
    ;   set running approriately
    ; load the pointer to the macro data (already in PointerA)
    ; read macro data and apply

    lda #0
    sta Ch_Ready

    lda Ch_Running
    bne :+
    rts
:

    lda Ch_InstOffset
    cmp Ch_Length
    bcc :+
    ; done
    lda #0
    sta Ch_Running
    rts
:

    tay
    lda (PointerA), y   ; pointer to volume data
    ldy #0
    sta (PointerD), y   ; buffer
    inc Ch_InstOffset

    lda #BufferReady::DutyVol
    sta Ch_Ready
    rts

doubleIncChannel:
    inc Offset

incrementChannel:
    inc Offset

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

    lda #0
    sta Ch_Ready

    ; Check for wait. if !zero, decrement and return
    lda Ch_Wait
    beq :+
    dec Ch_Wait
    ;sec
    ;sbc #1
    ;sta Ch_Wait
    rts
:

    ; Get Frame list
    ldy #ChannelPointers::Frames
    lda (PointerA), y ; points to frameList
    sta PointerC+0
    iny
    lda (PointerA), y
    sta PointerC+1

    lda Ch_CurrentFrame
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
    sta Ch_Tick

    lda Ch_Id
    cmp #3
    bne :+
    ; Noise stuff
    lda Data
    ldy #0
    sta (PointerD), y
    inc Offset
    lda #BufferReady::Period | BufferReady::Counter
    sta Ch_Ready
    rts
:
    ; Not noise stuff
    ; Store note Lo value in buffer
    lda Data
    asl a   ; note table is a word table
    tax
    lda NoteTable, x
    ldy #0
    sta (PointerD), y

    ; Store note Hi value in buffer
    inx
    lda NoteTable, x
    iny
    sta (PointerD), y
    inc Offset

    lda #BufferReady::TimerLo | BufferReady::TimerHi
    sta Ch_Ready

    lda #1
    sta Ch_Running
    lda #0
    sta Ch_InstOffset
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
    asl a   ; index -> offset
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
    ora #$80
    sta GoToOrder
    rts ; TODO: verify this is correct

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

cmdFnInstrument:
    ; Get argument
    iny
    lda (PointerFrame), y
    sta Ch_InstId
    ldx #0
    sta (PointerDbg, x)
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

    .if SingleChannelInstrumentLength <> 35
        .error "Instrument Length missmatch"
    .endif
    ldx Ch_Id
    lda Mult35, x
    tax

    ; Volume Loop
    ldy #0
    lda (PointerMacro), y
    sta ChannelInstruments, x

    ; Volume Release
    inx
    ldy #1
    lda (PointerMacro), y
    sta ChannelInstruments, x

    ; Volume Length
    inx
    ldy #2
    lda (PointerMacro), y
    sta ChannelInstruments, x

    ; Offset
    inx
    lda #0
    sta ChannelInstruments, x

    ; Running
    inx
    sta ChannelInstruments, x

    ; Volume Pointer
    lda PointerMacro+0
    clc
    adc #3
    sta PointerMacro+0
    bcc :+
    inc PointerMacro+1
:
    inx
    lda PointerMacro+0
    sta ChannelInstruments, x

    inx
    lda PointerMacro+1
    sta ChannelInstruments, x

    ; TODO: the rest of the macros, lol

    jmp doubleIncChannel

cmdFnWait:
    ; Get argument
    iny
    lda (PointerFrame), y

    ; Store it
    sta Ch_Wait

    ; Save offset
    tya
    sta Offset
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

; Stop the currently playing instrument for the current channel.
cmdFnHalt:
    ; TODO: write this after instruments are implemented
    lda #1
    sta Ch_Ready
    lda #0
    sta Ch_Running
    inc Offset
    rts

; Write buffers to the APU
WriteBuffers:
    lda EngineFlags
    and #EngineFlag::BufferReady
    bne :+
    rts
:
    ; Turn off ready flag
    lda EngineFlags
    and #(EngineFlag::BufferReady ^ $FF)
    sta EngineFlags

    ;;
    ;; Pulse A
    ;;
    lda PulseA_Ready
    and #BufferReady::DutyVol ; DutyVol
    beq :+
    lda PulseA_DutyVol
    ora #$30    ; disable length counter
    sta APU::PulseA_DutyVol
:
    lda PulseA_Ready
    and #BufferReady::Sweep ; Sweep
    beq :+
    lda PulseA_Sweep
    sta APU::PulseA_Sweep
:
    lda PulseA_Ready
    and #BufferReady::TimerLo   ; TimerLo
    beq :+
    lda PulseA_TimerLo
    sta APU::PulseA_TimerLo
:
    lda PulseA_Ready
    and #BufferReady::TimerHi   ; TimerHi
    beq :+
    lda PulseA_TimerHi
    ora #$F0
    sta APU::PulseA_TimerHi
:
    lda #0
    sta PulseA_Ready

    ;;
    ;; Pulse B
    ;;
    lda PulseB_Ready
    and #BufferReady::DutyVol ; DutyVol
    beq :+
    lda PulseB_DutyVol
    ora #$30    ; disable length counter
    sta APU::PulseB_DutyVol
:
    lda PulseB_Ready
    and #BufferReady::Sweep ; Sweep
    beq :+
    lda PulseB_Sweep
    sta APU::PulseB_Sweep
:
    lda PulseB_Ready
    and #BufferReady::TimerLo ; TimerLo
    beq :+
    lda PulseB_TimerLo
    sta APU::PulseB_TimerLo
:
    lda PulseB_Ready
    and #BufferReady::TimerHi ; TimerHi
    beq :+
    lda PulseB_TimerHi
    ora #$F0
    sta APU::PulseB_TimerHi
:
    lda #0
    sta PulseB_Ready

    ;;
    ;; Triangle
    ;;
    ;lda Triangle_Counter
    ;ora #$80    ; disable length counter
    lda #$FF
    sta APU::Triangle_Counter
    lda Triangle_Ready
    and #BufferReady::TimerLo
    beq :+
    lda Triangle_TimerLo
    sta APU::Triangle_TimerLo
:
    lda Triangle_Ready
    and #BufferReady::TimerHi
    beq :+
    lda Triangle_TimerHi
    ora #$F0
    sta APU::Triangle_TimerHi
:
    lda #0
    sta Triangle_Ready

    ;;
    ;; Noise
    ;;
    lda Noise_Ready
    and #BufferReady::Volume
    beq :+
    lda Noise_Volume
    ora #$30    ; force constant volume
    sta APU::Noise_Volume
:
    lda Noise_Ready
    and #BufferReady::Period
    beq :+
    lda Noise_Period
    sta APU::Noise_Period
:
    lda Noise_Ready
    and #BufferReady::Counter
    beq :+
    lda #$FF
    sta APU::Noise_Counter
:
    lda #0
    sta Noise_Ready
    rts

; TODO: start playing the currently loaded song
Play:
    lda EngineFlags
    ora #EngineFlag::EnableSong
    sta EngineFlags
    rts

Pause:
    lda EngineFlags
    and #(EngineFlag::EnableSong ^ $FF)
    sta EngineFlags
    rts

StopSfx:
    lda EngineFlags
    and #(EngineFlag::EnableSfx ^ $FF)
    sta EngineFlags
    rts

PlaySfx:
    tax
    ora #$80
    sta SfxId

    lda EngineFlags
    ora #EngineFlag::EnableSfx
    sta EngineFlags

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

    ; Last value is a pointer to the SFX data
    iny
    lda (PointerA), y
    sta Sfx_State + SfxState::Data+0
    iny
    lda (PointerA), y
    sta Sfx_State + SfxState::Data+1
    rts

; PointerA points to channel data
; This only clears the channel state, not the Instrument
; state for the given channel
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

Mult35:
    .repeat 5, i
        .byte (i * 35)
    .endrepeat
