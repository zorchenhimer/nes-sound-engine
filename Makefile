export PATH := $(PATH):../tools/cc65/bin/

SOURCES:= main.asm \
		  engine.asm engine_ram.asm \
		  music.asm

NAME:= sound-engine
NESCFG:=nes_nrom.cfg

EXT=
ifeq ($(OS),Windows_NT)
EXT=.exe
endif

# Assembler and linker paths
CA = ca65$(EXT)
LD = ld65$(EXT)
CONV = conversion$(EXT)

CAFLAGS = -g -t nes
LDFLAGS = -C $(NESCFG) --dbgfile bin/$(NAME).dbg -m bin/$(NAME).map

all: bin/ bin/$(NAME).nes

clean:
	rm -rf bin/* music.asm conversion/*.exe

bin/:
	mkdir -p bin

bin/sound-engine.nes: bin/$(NAME).o
	$(LD) $(LDFLAGS) -o $@ $^

bin/sound-engine.o: $(SOURCES)
	$(CA) $(CAFLAGS) -o $@ $<

#conversion/conversion.exe: conversion/*.go
#	$(MAKE) -C conversion/

music.asm: RunnJumper_6132019.txt bin/$(CONV)
	bin/$(CONV) -i $< -o $@

bin/$(CONV): conversion/*.go
	cd conversion && go build -o ../bin/$(CONV)
