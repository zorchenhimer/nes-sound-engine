package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"flag"
)

func main() {
	var inFile string
	var outFile string

	flag.StringVar(&inFile, "i", "", "Input file")
	flag.StringVar(&outFile, "o", "", "Output file")
	flag.Parse()

	if inFile == "" {
		fmt.Println("Input file required!")
		os.Exit(1)
	}

	if outFile == "" {
		fmt.Println("Output file required!")
		os.Exit(1)
	}

	data, err := parse(inFile)
	if err != nil {
		fmt.Printf("Unable to parse: %s\n", err)
		os.Exit(1)
	}

	err = data.Process()
	if err != nil {
		fmt.Printf("Error processing: %s\n", err)
		os.Exit(1)
	}

	err = data.WriteAsm(outFile)
	if err != nil {
		fmt.Printf("Unable to write ASM: %s\n", err)
		os.Exit(1)
	}
}

func (md *MusicData) WriteAsm(filename string) error {
	sb := strings.Builder{}
	sb.WriteString("; asmsyntax=ca65\n\nSongMeta:\n\t.word SongList\n\t.word InstrumentList\n\t.word InstrumentMacroList\n\n")

	fmt.Fprintln(&sb, "InstrumentMacroList:")
	mcount := 0
	sm := strings.Builder{}
	fmt.Println("len(md.Macros):", len(md.Macros))
	for _, m := range md.Macros {
		if !m.Used {
			fmt.Println("macro not used")
			continue
		}

		fmt.Fprintf(&sb, "\t.word macro_%d_%d\n", m.Type, m.OrigId)
		fmt.Fprintf(&sm, "%s:\n", m.Label())
		fmt.Fprintf(&sm, "\t.byte %d\n", m.Loop)
		fmt.Fprintf(&sm, "\t.byte %d\n", m.Release)
		fmt.Fprintf(&sm, "\t.byte %d\n", len(m.Data))
		fmt.Fprintf(&sm, "\t.byte %s\n\n", m.DataString())
		m.Index = mcount
		mcount++
	}
	sb.WriteString("\n")
	sb.WriteString(sm.String())
	sb.WriteString("\n")
	sb.WriteString("InstrumentList:\n")

	si := &strings.Builder{}
	for _, ins := range md.Instruments {
		fmt.Fprintf(&sb, "\t.word %s\n", ins.Label())
		fmt.Fprintf(si, "; %s\n", ins.Name)
		fmt.Fprintf(si, "%s:\n", ins.Label())

		if ins.Volume != nil {
			fmt.Fprintf(si, "\t.byte %d\n", ins.Volume.Index)
		} else {
			fmt.Fprintln(si, "\t.byte 255")
		}

		if ins.Arpeggio != nil {
			fmt.Fprintf(si, "\t.byte %d\n", ins.Arpeggio.Index)
		} else {
			fmt.Fprintln(si, "\t.byte 255")
		}

		if ins.Pitch != nil {
			fmt.Fprintf(si, "\t.byte %d\n", ins.Pitch.Index)
		} else {
			fmt.Fprintln(si, "\t.byte 255")
		}

		if ins.HiPitch != nil {
			fmt.Fprintf(si, "\t.byte %d\n", ins.HiPitch.Index)
		} else {
			fmt.Fprintln(si, "\t.byte 255")
		}

		if ins.Duty != nil {
			fmt.Fprintf(si, "\t.byte %d\n", ins.Duty.Index)
		} else {
			fmt.Fprintln(si, "\t.byte 255")
		}

		si.WriteString("\n")
	}
	//sb.WriteString("InstrumentCount = (* - InstrumentList) / 2\n\n")
	sb.WriteString(si.String())

	ss := &strings.Builder{}	// song metadata
	//sf := &strings.Builder{}	// frame data

	fmt.Fprintln(&sb, "SongList:")
	for _, s := range md.Songs {
		fmt.Fprintf(&sb, "\t.word %s ; %s\n", s.Label(), s.Name)

		fmt.Fprintf(ss, "%s:\n", s.Label())
		fmt.Fprintf(ss, "\t.byte %d\n", s.Rows)
		fmt.Fprintf(ss, "\t.byte %d\n", s.Speed)
		fmt.Fprintf(ss, "\t.byte %d\n", s.Tempo)
		//fmt.Fprintf(ss, "\t.byte %d\n\n", s.Frames)

		// Frame pointer list length
		fmt.Fprintf(ss, "\t.byte %d\n\n", len(s.FramesPulseA))

		fmt.Fprintf(ss, "\t.word %s_frameList_pulseA\n", s.Label())
		fmt.Fprintf(ss, "\t.word %s_frameList_pulseB\n", s.Label())
		fmt.Fprintf(ss, "\t.word %s_frameList_triangle\n", s.Label())
		fmt.Fprintf(ss, "\t.word %s_frameList_noise\n", s.Label())

		// Order data length
		fmt.Fprintf(ss, "\n\t.byte %d\n\n", len(s.OrderPulseA))

		// Order data
		fmt.Fprintf(ss, "\t.word %s_order_pulseA\n", s.Label())
		fmt.Fprintf(ss, "\t.word %s_order_pulseB\n", s.Label())
		fmt.Fprintf(ss, "\t.word %s_order_triangle\n", s.Label())
		fmt.Fprintf(ss, "\t.word %s_order_noise\n", s.Label())

		sfrm := &strings.Builder{}	// frame data
		fmt.Fprintf(ss, "\n%s_frameList_pulseA:\n", s.Label())
		writeFrameData(ss, sfrm, fmt.Sprintf("%s_frameList_pulseA", s.Label()), s.FramesPulseA)
		fmt.Fprintf(ss, "\n%s_frameList_pulseB:\n", s.Label())
		writeFrameData(ss, sfrm, fmt.Sprintf("%s_frameList_pulseB", s.Label()), s.FramesPulseB)
		fmt.Fprintf(ss, "\n%s_frameList_triangle:\n", s.Label())
		writeFrameData(ss, sfrm, fmt.Sprintf("%s_frameList_triangle", s.Label()), s.FramesTriangle)
		fmt.Fprintf(ss, "\n%s_frameList_noise:\n", s.Label())
		writeFrameData(ss, sfrm, fmt.Sprintf("%s_frameList_noise", s.Label()), s.FramesNoise)

		fmt.Fprintf(sfrm, "%s_order_pulseA:\n", s.Label())
		fmt.Fprintf(sfrm, getOrderString(s.OrderPulseA))
		fmt.Fprintf(sfrm, "\n%s_order_pulseB:\n", s.Label())
		fmt.Fprintf(sfrm, getOrderString(s.OrderPulseB))
		fmt.Fprintf(sfrm, "\n%s_order_triangle:\n", s.Label())
		fmt.Fprintf(sfrm, getOrderString(s.OrderTriangle))
		fmt.Fprintf(sfrm, "\n%s_order_noise:\n", s.Label())
		fmt.Fprintf(sfrm, getOrderString(s.OrderNoise))

		ss.WriteString("\n")
		ss.WriteString(sfrm.String())
		ss.WriteString("\n")
		ss.WriteString("\n")
	}

	sb.WriteString("\n")
	sb.WriteString(ss.String())
	fmt.Fprintf(&sb, "SongList_Length = %d\n", len(md.Songs))
	fmt.Fprintf(&sb, "MacroList_Length = %d\n", len(md.Macros))
	fmt.Fprintf(&sb, "InstrumentList_Length = %d\n", len(md.Instruments))

	//fmt.Println(sb.String())
	return ioutil.WriteFile(filename, []byte(sb.String()), 0777)
}

func getOrderString(list []int) string {
	data := []string{}
	for _, i := range list {
		data = append(data, fmt.Sprintf("%d", i))
	}
	return fmt.Sprintf("\t.byte %s", strings.Join(data, ", "))
}

func writeFrameData(bufIdx, bufData *strings.Builder, label string, list frameList) {
	//fmt.Fprintf()
	for _, frame := range list {
		fmt.Fprintf(bufIdx, "\t.word %s_%d\n", label, frame.PatternId)

		// frame data
		fmt.Fprintf(bufData, "%s_%d:\n", label, frame.PatternId)
		fmt.Fprintf(bufData, frame.Asm())
		fmt.Fprintf(bufData, "\n")
	}

}

func (md *MusicData) Process() error {
	// TODO: remove unused frames (not listed in an ORDER entry)
	// TODO: merge duplicate macros
	md.usedInstruments = map[int]bool{}

	for _, s := range md.Songs {
		newFrames := frameList{}
		for i, frame := range s.FramesPulseA {
			f, inst, err := frame.process()
			if err != nil {
				return fmt.Errorf("Error processing PulseA frame %d in song %s: %s", i, s.Name, err)
			}
			newFrames = append(newFrames, f)
			md.useInstruments(inst)
		}
		s.FramesPulseA = newFrames

		newFrames = frameList{}
		for i, frame := range s.FramesPulseB {
			f, inst, err := frame.process()
			if err != nil {
				return fmt.Errorf("Error processing PulseB frame %d in song %s: %s", i, s.Name, err)
			}
			newFrames = append(newFrames, f)
			md.useInstruments(inst)
		}
		s.FramesPulseB = newFrames

		newFrames = frameList{}
		for i, frame := range s.FramesTriangle {
			f, inst, err := frame.process()
			if err != nil {
				return fmt.Errorf("Error processing Triangle frame %d in song %s: %s", i, s.Name, err)
			}
			newFrames = append(newFrames, f)
			md.useInstruments(inst)
		}
		s.FramesTriangle = newFrames

		newFrames = frameList{}
		for i, frame := range s.FramesNoise {
			f, inst, err := frame.process()
			if err != nil {
				return fmt.Errorf("Error processing Noise frame %d in song %s: %s", i, s.Name, err)
			}
			newFrames = append(newFrames, f)
			md.useInstruments(inst)
		}
		s.FramesNoise = newFrames
	}

	return nil
}

func printDataValueList(list []dataValue) {
	for idx, val := range list {
		fmt.Printf("[%d] %s\n", idx, val.String())
		if val.Type() == DT_Command {
			fmt.Println("")
		}
	}
}

func (f frame) process() (frame, []int, error) {
	var inst int = -1
	var empty int = 0
	var volume int = -1

	var instList = []int{}

	ndata := []dataValue{}
	//shouldntHappen := false
	for _, item := range f.data {

		switch item.Type() {
		case DT_Command:
			cmd := item.(dataCommand)

			if cmd.Command == "Empty" {
				empty++
				continue
			}

			if empty > 0 {
				ndata = append(ndata, newDataCommand("Wait", empty))
				empty = 0
			}

			switch cmd.Command {
			case "Volume":
				nvol := cmd.Args
				if volume != nvol {
					volume = nvol
					ndata = append(ndata, newDataCommand("Volume", nvol))
				}

			default:
				ndata = append(ndata, cmd)
			}

		case DT_Instrument:
			if empty > 0 {
				//fmt.Println("empty clear on instrument.  shouldn't ever happen, lol")
				ndata = append(ndata, newDataCommand("Wait", empty))
				//fmt.Println(ndata)
				//printDataValueList(ndata)
				//shouldntHappen = true
				empty = 0
			}

			cmd := item.(dataInstrument)
			var ninst int = cmd.OrigId

			if inst != ninst {
				inst = ninst
				instList = append(instList, inst)
				i, err := newDataInstrument(int(ninst))
				if err != nil {
					return frame{}, nil, err
				}
				ndata = append(ndata, i)
			}
		case DT_Note, DT_Noise:
			if empty > 0 {
				//fmt.Println("empty end on note")
				ndata = append(ndata, newDataCommand("Wait", empty))
				empty = 0
			}

			ndata = append(ndata, item)
		}
	}

	if empty > 0 {
		//fmt.Println("empty end on frame end")
		ndata = append(ndata, newDataCommand("Wait", empty))
		empty = 0
	}

	//return frame{}, nil, fmt.Errorf("NO, STOP")
	if len(ndata) == 0 {
		//fmt.Printf(">> data empty; song %q pattern %d", )
		//fmt.Println("f.data: ", f.data)
		return frame{}, nil, fmt.Errorf("empty data in pattern %d", f.PatternId)
	}
	return frame{PatternId: f.PatternId, data: ndata}, instList, nil
}

