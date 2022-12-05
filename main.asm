; asmsyntax=ca65

.include "nes2header.inc"
nes2mapper 0
nes2prg 16 * 2* 1024  ; 32k PRG
nes2chr 1 * 8 * 1024  ; 8k CHR ROM
;nes2chrram 1 * 8 * 1024 ; 8k CHR RAM
nes2wram 1 * 8 * 1024
nes2mirror 'V'
nes2tv 'N'
nes2end

.feature leading_dot_in_identifiers
.feature underline_in_numbers
.feature addrsize

; Button Constants
BUTTON_A        = 1 << 7
BUTTON_B        = 1 << 6
BUTTON_SELECT   = 1 << 5
BUTTON_START    = 1 << 4
BUTTON_UP       = 1 << 3
BUTTON_DOWN     = 1 << 2
BUTTON_LEFT     = 1 << 1
BUTTON_RIGHT    = 1 << 0

.segment "VECTORS"
    .word NMI
    .word RESET
    .word IRQ

.segment "ZEROPAGE"
controller:     .res 1
controller_Old: .res 1
IgnoreInput:    .res 1
btnY:           .res 1
btnX:           .res 1
Sleeping:       .res 1

.segment "CHR0"
    ;.byte "CHR0"
    .incbin "font.chr"
.segment "CHR1"
    ;.byte "CHR1"
    ;.incbin "credits_01.chr"

.segment "PAGE1"
    .byte "PAGE1"
    .include "engine.asm"

.segment "PAGE0"
    .byte "PAGE0"

DbgPalette:
    .byte $0F, $00, $10, $20

DbgWords:
    .byte $20, $42
    .asciiz "Debug Info"

    .byte $20, $82
    .asciiz "Frames"

    .byte $20, $A2
    .asciiz "Current Row"

    .byte $20, $C2
    .asciiz "Instruments"

    ;.byte $20, $E2
    ;.asciiz "Frames"

    ;.byte $21, $02
    ;.asciiz "PulseB"

    ;.byte $21, $22
    ;.asciiz "Triangle"

    ;.byte $21, $42
    ;.asciiz "Noise"

    .byte 0

IRQ:
    jmp IRQ ; SOMETHING BROKE. FIND IT.

RESET:
    sei         ; Disable IRQs
    cld         ; Disable decimal mode

    ldx #$40
    stx $4017   ; Disable APU frame IRQ

    ldx #$FF
    txs         ; Setup new stack

    inx         ; Now X = 0

    stx $2000   ; disable NMI
    stx $2001   ; disable rendering
    stx $4010   ; disable DMC IRQs

:   ; First wait for VBlank to make sure PPU is ready.
    bit $2002   ; test this bit with ACC
    bpl :- ; Branch on result plus

:   ; Clear RAM
    lda #$00
    sta $0000, x
    sta $0100, x
    sta $0200, x
    sta $0300, x
    sta $0400, x
    sta $0500, x
    sta $0600, x
    sta $0700, x

    inx
    bne :-  ; loop if != 0

    bit $2002

; Clear screen
    lda #$20
    sta $2006
    lda #$00
    sta $2006
    lda #1

    ldy #4
    ldx #0
:
    sta $2007
    dex
    bne :-

    dey
    bne :-

; clear attr table
    lda #$23
    sta $2006
    lda #$C0
    sta $2006

    lda #0
    ldy #64
:
    sta $2007
    dey
    bne :-

; Load Palette
    lda #$3F
    sta $2006
    lda #$00
    sta $2006

    ldx #0
:
    lda DbgPalette,x
    sta $2007
    inx
    cpx #4
    bne :-

; Draw some words
    ldy #0  ; data offset
:
    ; address
    lda DbgWords, y
    beq @wordsDone
    sta $2006
    iny
    lda DbgWords, y
    sta $2006
    iny

    ; words
:
    lda DbgWords, y
    beq :+
    iny
    sta $2007
    jmp :-

:
    iny
    jmp :---

@wordsDone:

    lda #0
    sta $2005
    sta $2005

    lda #$80
    sta $2000

    lda #%00001010
    sta $2001

    lda #<SongMeta
    sta SoundEngine::PointerA+0
    lda #>SongMeta
    sta SoundEngine::PointerA+1
    jsr SoundEngine::SoundInit

    lda #1
    jsr SoundEngine::LoadSong

    ; macro instead for play?
    jsr SoundEngine::Play

Frame:
    ; TODO: input things for sound activation

    jsr ReadControllers

    lda #BUTTON_UP
    jsr ButtonPressedP1
    beq :+
    lda SoundEngine::Sfx::Default
    jsr SoundEngine::PlaySfx
:

;    lda #BUTTON_A
;    jsr ButtonPressedP1
;    beq :+
;    lda #1
;    jsr SoundEngine::LoadSong
;:

    jsr WaitForNMI
    jmp Frame

NMI:
    pha
    txa
    pha
    tya
    pha

    lda #$FF
    sta Sleeping

    jsr UpdateDebug

    lda #0
    sta $2005
    sta $2005

    jsr SoundEngine::WriteBuffers
    jsr SoundEngine::SoundProcess

    pla
    tay
    pla
    tax
    pla
    rti

WaitForNMI:
    bit Sleeping
    bpl WaitForNMI
    lda #0
    sta Sleeping
    rts

; Was a button pressed this frame?
ButtonPressedP1:
    sta btnX

    lda IgnoreInput
    beq :+
    ;dec IgnoreInput
    lda #0
    rts
:

    lda btnX
    and controller
    sta btnY

    lda controller_Old
    and btnX

    cmp btnY
    bne btnPress_stb

    ; no button change
    rts

btnPress_stb:
    ; button released
    lda btnY
    bne btnPress_stc
    rts

btnPress_stc:
    ; button pressed
    lda #1
    rts

; Player input
ReadControllers:
    lda controller
    sta controller_Old

    ; Freeze input
    lda #1
    sta $4016
    lda #0
    sta $4016

    LDX #$08
@player1:
    lda $4016
    lsr A           ; Bit0 -> Carry
    rol controller ; Bit0 <- Carry
    dex
    bne @player1
    rts

UpdateDebug:
    ; $208F for the column on first row
    clc
    lda #$20
    sta $2006
    lda #$8F
    sta $2006

    ldx SoundEngine::Global::OrderId
    jsr WriteHex

    lda #$3A
    sta $2007
    lda #1
    sta $2007

    ldx SoundEngine::ChannelStateStart + (SoundEngine::SingleChannelStateLength * 0) + 1
    jsr WriteHex

    lda #1
    sta $2007

    ldx SoundEngine::ChannelStateStart + (SoundEngine::SingleChannelStateLength * 1) + 1
    jsr WriteHex

    lda #1
    sta $2007

    ldx SoundEngine::ChannelStateStart + (SoundEngine::SingleChannelStateLength * 2) + 1
    jsr WriteHex

    lda #1
    sta $2007

    ldx SoundEngine::ChannelStateStart + (SoundEngine::SingleChannelStateLength * 3) + 1
    jsr WriteHex

    lda #$20
    sta $2006
    lda #$AF
    sta $2006
    ldx SoundEngine::Global::CurrentRow
    jsr WriteHex

    lda #$20
    sta $2006
    lda #$CF
    sta $2006
    ldx SoundEngine::PulseA_InstId
    jsr WriteHex

    lda #1
    sta $2007

    ldx SoundEngine::PulseB_InstId
    jsr WriteHex

    lda #1
    sta $2007

    ldx SoundEngine::Triangle_InstId
    jsr WriteHex

    lda #1
    sta $2007

    ldx SoundEngine::Noise_InstId
    jsr WriteHex

    rts

WriteHex:
    txa
    lsr a
    lsr a
    lsr a
    lsr a
    ora #$F0
    sta $2007

    txa
    ora #$F0
    sta $2007
    rts

;.include "music-data.asm"
.include "music.asm"
