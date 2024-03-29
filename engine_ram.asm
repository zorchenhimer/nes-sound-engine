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

.macro genInstMacroStruct basename
    .ident(.concat(basename, "_Loop")): .res 1
    .ident(.concat(basename, "_Release")): .res 1
    .ident(.concat(basename, "_Length")): .res 1
    .ident(.concat(basename, "_Offset")): .res 1    ; read offset
    .ident(.concat(basename, "_Running")): .res 1   ; Macro currently running; TODO: rename this flags?
    .ident(.concat(basename, "_Pointer")): .res 2

    .ifdef DBGPRINT
        .out .concat(" ", .concat(basename, "_Loop"))
        .out .concat(" ", .concat(basename, "_Release"))
        .out .concat(" ", .concat(basename, "_Length"))
        .out .concat(" ", .concat(basename, "_Offset"))
        .out .concat(" ", .concat(basename, "_Running"))
        .out .concat(" ", .concat(basename, "_Pointer"))
    .endif
.endmacro

; Loaded Instruments
.macro genInstrumentStruct basename
    .ifdef DBGPRINT
        .out basename
    .endif

    genInstMacroStruct .concat(basename, "_Volume")
    genInstMacroStruct .concat(basename, "_Arpeggio")
    genInstMacroStruct .concat(basename, "_Pitch")
    genInstMacroStruct .concat(basename, "_HiPitch")
    genInstMacroStruct .concat(basename, "_Duty")
.endmacro

.macro genChannelStateStruct basename
    .ident(.concat(basename, "_Wait")): .res 1
    .ident(.concat(basename, "_CurrentFrame")): .res 1
    .ident(.concat(basename, "_ReadOffset")): .res 1

    .ident(.concat(basename, "_Tick")): .res 1
    .ident(.concat(basename, "_TickRate")): .res 1

    .ident(.concat(basename, "_LastNote")): .res 1 ; Index of last note read
    .ident(.concat(basename, "_Ready")): .res 1

    .ifdef DBGPRINT
        .out basename
        .out .concat(" ", .concat(basename, "_CurrentFrame"))
        .out .concat(" ", .concat(basename, "_ReadOffset"))
        .out .concat(" ", .concat(basename, "_Tick"))
        .out .concat(" ", .concat(basename, "_TickRate"))
    .endif
.endmacro

.struct ChannelPointers
    Frames  .word ; current song's list of frames
    Orders  .word ; current song's list of orders
.endstruct

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

PointerDbg: .res 2

Ch_Wait: .res 1
Ch_CurrentFrame: .res 1
Ch_Tick: .res 1
Ch_Id: .res 1
Ch_Ready: .res 1 ; buffer update flag
Ch_Length: .res 1
Ch_Note: .res 1
Ch_Running: .res 1
Ch_InstOffset: .res 1
Ch_Pointer: .res 1   ; pointer to macro data
Ch_InstId: .res 1

ChIns_VolLoop: .res 1
ChIns_VolRelease: .res 1
ChIns_VolLength: .res 1
ChIns_VolPointer: .res 1

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
OrderId:   .res 1
OrderIdMax:    .res 1
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

ChannelStateStart:
genChannelStateStruct "PulseA_State"
SingleChannelStateLength = (* - ChannelStateStart)
genChannelStateStruct "PulseB_State"
genChannelStateStruct "Triangle_State"
genChannelStateStruct "Noise_State"
JustStateLength = * - ChannelStateStart

ChannelInstruments:
genInstrumentStruct "PulseA"
SingleChannelInstrumentLength = (* - ChannelInstruments)
genInstrumentStruct "PulseB"
genInstrumentStruct "Triangle"
genInstrumentStruct "Noise"
ChannelStateLength = * - ChannelStateStart
ChannelInstrumentLength = * - ChannelInstruments

.out .sprintf("One instrument struct length: %d", SingleChannelInstrumentLength)
.out .sprintf("ChannelStateLength: %d", ChannelStateLength)
.out .sprintf("ChannelInstrumentLength: %d", ChannelInstrumentLength)

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

PulseA_Ready:   .res 1
PulseB_Ready:   .res 1
Triangle_Ready:   .res 1
Noise_Ready:   .res 1

.enum BufferReady
    TimerLo = 1 << 0    ; Pulse, Triangle
    Volume  = 1 << 0    ; Noise

    TimerHi = 1 << 1    ; Pulse, Triangle
    Period  = 1 << 1    ; Noise

    DutyVol = 1 << 2    ; Pulse
    Counter = 1 << 2    ; Triangle, Noise

    Sweep   = 1 << 3    ; Pulse
.endEnum

PulseA_InstId: .res 1
PulseB_InstId: .res 1
Triangle_InstId: .res 1
Noise_InstId: .res 1

; Currently playing sound effect
; High bit on if playing
SfxId: .res 1

EngineFlags: .res 1
GoToOrder:   .res 1

.enum EngineFlag
    Ready       = $01   ; Set if the engine has been initialized
    EnableSong  = $80   ; If set, don't run the song (keep current values, but don't populate buffers)
    EnableSfx   = $40   ; If set, don't run SFX (same as above)
    BufferReady = $20   ; Is there something in the buffer ready to write?
.endenum

; No DMC channel

.enum Sfx
    Default = 0
.endenum

.popseg

