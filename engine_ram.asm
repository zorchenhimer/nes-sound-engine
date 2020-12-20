; asmsyntax=ca65

.pushseg

.struct SfxState
    Offset      .byte ; Current offset in data
    Ticks       .byte ; Ticks to next event
    TickRate    .byte ; Number of ticks between events
    Volume      .byte ;
    Data        .word ; Pointer to note/command data
    Length      .byte ; Length of data, including the ending CMD::Disable
.endstruct

.enum Enable
    PulseA      = 1 << 0
    PulseB      = 1 << 1
    Triangle    = 1 << 2
    Noise       = 1 << 3
    ;DMC         = 1 << 4
.endenum

.struct InstrumentMacro
    Loop .byte
    Release .byte
    Length .byte
    Pointer .word
.endstruct

; Loaded Instruments
.struct Instrument
    Volume      .tag InstrumentMacro
    Arpeggio    .tag InstrumentMacro
    Pitch       .tag InstrumentMacro
    HiPitch     .tag InstrumentMacro
    Duty        .tag InstrumentMacro
.endstruct

.struct ChannelState
    Wait        .byte   ; rows to wait for the next read
    ;Frames      .word   ; pointer to the list of frames for this channel
    CurrentFrame .byte ; index into the above frame list
    ReadOffset  .byte   ; byte offset of the next row in the frame

    ; Instrument stuff
    Tick        .byte   ; basically the offset into the instrument data
    TickRate    .byte
    Instrument  .tag Instrument   ; loaded instrument
.endstruct

.struct ChannelPointers
    Frames  .word ; current song's list of frames
    Orders  .word ; current song's list of orders
.endstruct

.out .sprintf("sizeof(ChannelState): %d", .sizeof(ChannelState))

.segment "ZEROPAGE"
PointerA:   .res 2
PointerB:   .res 2
PointerC:   .res 2
PointerD:   .res 2
PointerFn:  .res 2
PointerFrame:   .res 2 ; current working frame
PointerOrder:   .res 2 ; current order
PointerInstrument: .res 2
PointerMacro:   .res 2

Sfx_State:              .tag SfxState
SongListPointer:        .res 2
InstrumentListPointer:  .res 2
MacroListPointer:       .res 2

PulseA_Pointers:   .tag ChannelPointers
PulseB_Pointers:   .tag ChannelPointers
Triangle_Pointers: .tag ChannelPointers
Noise_Pointers:    .tag ChannelPointers

; Working vars
Offset: .res 1
Data: .res 1
;ChannelId: .res 1   ; output channel buffer

.segment "OAM"

; Global state
.scope Global
Meta:   .res 2  ; pointer to song meta

Rows:   .res 1
Speed:  .res 1
Tempo:  .res 1
Frames: .res 1
CurrentRow: .res 1

Tick:       .res 1  ; ticks until the next read (counts down)

; Index into the order lists for each channel (all share the same index)
OrderIdx:   .res 1
OrderIdxMax:    .res 1
.endscope

.enum APU
PulseA_DutyVol = $4000
PulseA_Sweep = $4001
PulseA_TimerLo = $4002
PulseA_TimerHi = $4003

PulseB_DutyVol = $4004
PulseB_Sweep = $4005
PulseB_TimerLo = $4006
PulseB_TimerHi = $4007

Triangle_Counter = $4008
Triangle_TimerLo = $400A
Triangle_TimerHi = $400B

Noise_Volume = $400C
Noise_Period = $400E
Noise_Counter = $400F
.endenum

PulseA_State:   .tag ChannelState
PulseB_State:   .tag ChannelState
Triangle_State: .tag ChannelState
Noise_State:    .tag ChannelState

PulseA_TimerLo:  .res 1 ; $4002
PulseA_TimerHi:  .res 1 ; $4003
PulseA_DutyVol:  .res 1 ; $4000
PulseA_Sweep:    .res 1 ; $4001

PulseB_TimerLo:  .res 1 ; $4006
PulseB_TimerHi:  .res 1 ; $4007
PulseB_DutyVol:  .res 1 ; $4004
PulseB_Sweep:    .res 1 ; $4005

Triangle_TimerLo: .res 1 ; $400A
Triangle_TimerHi: .res 1 ; $400B
Triangle_Counter: .res 1 ; $4008

Noise_Volume:    .res 1 ; $400C
Noise_Period:    .res 1 ; $400E
Noise_Counter:   .res 1 ; $400F

; Currently playing sound effect
; High bit on if playing
SfxId: .res 1

; No DMC channel

.enum Sfx
    Default = 0
.endenum

; Update flags
.enum PulseUpdate
    DutyVolume  = 1 << 0
    Sweep       = 1 << 1
    TimerHi     = 1 << 2
    TimerLo     = 1 << 3
.endenum

.enum TriUpdate
    Counter = 1 << 4
    TimerLo = 1 << 5
    TimerHi = 1 << 6
.endenum

.enum NoiseUpdate
    Volume  = 1 << 0
    Period  = 1 << 1
    Counter = 1 << 2
.endenum

; Low bits PulseA, hi bits PulseB
sndFlags_Pulse:     .res 1

; xTTT xNNN
sndFlags_TriNoise:  .res 1
.popseg

