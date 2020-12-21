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
    .byte "CHR0"
.segment "CHR1"
    .byte "CHR1"

.segment "PAGE1"
    .byte "PAGE1"
    .include "engine.asm"

.segment "PAGE0"
    .byte "PAGE0"

IRQ:
    rti

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

    lda #$80
    sta $2000

    lda #<SongMeta
    sta SoundEngine::PointerA+0
    lda #>SongMeta
    sta SoundEngine::PointerA+1
    jsr SoundEngine::SoundInit

Frame:
    ; TODO: input things for sound activation

    jsr ReadControllers

    lda #BUTTON_UP
    jsr ButtonPressedP1
    beq :+
    lda SoundEngine::Sfx::Default
    jsr SoundEngine::PlaySfx
:

    lda #BUTTON_A
    jsr ButtonPressedP1
    beq :+
    lda #1
    jsr SoundEngine::LoadSong
:

    jsr SoundEngine::SoundProcess
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
    jsr SoundEngine::WriteBuffers

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

;.include "music-data.asm"
.include "music.asm"
