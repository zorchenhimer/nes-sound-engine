package main

import (
	"fmt"
	"strconv"
	"regexp"
	"io/ioutil"
	"strings"
	"bytes"
)

var (
	re_spaces = regexp.MustCompile(`\s+`)
	re_Track = regexp.MustCompile(`^TRACK\s+(\d+)\s+(\d+)\s+(\d+)\s+"([^"]+)"$`)
)

var noteReplacements map[string][]byte = map[string][]byte{
	"#": []byte("s"),
	"+": []byte("s"),
	"-": []byte(""),
	"b": []byte("b"),
	"f": []byte("b"),

}

var noteReplacementsFull map[string][]byte = map[string][]byte{
	"...": []byte("Empty"),
	"---": []byte("Halt"),
	"===": []byte("Release"),
}

var commands map[byte]string = map[byte]string{
	'0' : "Arpeggio",
	'1' : "SlideUp",
	'2' : "SlideDown",
	'3' : "AutomaticPortamento",
	'4' : "Vibrato",
	'7' : "Tremolo",
	'A' : "VolumeSlide",
	'B' : "Jump",
	'C' : "Halt",
	'D' : "Skip",
	'E' : "Volume",
	'F' : "SpeedTempo",
	'G' : "NoteDelay",
	'H' : "HardwareSweepUp",
	'I' : "HardwareSweepDown",
	'P' : "FinePitch",
	'Q' : "NoteSlideUp",
	'R' : "NoteSlideDown",
	'S' : "DelayedCut",
	'V' : "TimbreControl",
	'W' : "DPCM_Pitch",
	'X' : "DPCM_Retrigger",
	'Y' : "DPCM_SampleOffset",
	'Z' : "DeltaCounter",
}


func parse(filename string) (*MusicData, error) {
	raw, err := ioutil.ReadFile(filename)
	if err != nil {
		return nil, fmt.Errorf("Unable to read %q: %s")
	}

	var currentTrack *song
	//macros := []*macro{}
	md := &MusicData{
		Songs: []*song{},
		Instruments: []*instrument{},
		usedInstruments: map[int]bool{},
		Macros: []*macro{},
	}

	//macrosDumped := false

	lines := bytes.Split(bytes.ReplaceAll(raw, []byte("\r"), []byte("")), []byte("\n"))
	for lnum, line := range lines {
		cols := bytes.Split(line, []byte(" "))
		if len(cols) == 0 {
			continue
		}

		switch string(cols[0]) {
		case "MACRO":
			m, err := parseMacro(line)
			if err != nil {
				return nil, fmt.Errorf("Error parsing macro on line %d: %s", lnum+1, err)
			}

			found := false
			for _, macro := range md.Macros {
				if macro.Equals(m) {
					_, ok := macro.OrigTypeIds[m.Type]
					if !ok {
						macro.OrigTypeIds[m.Type] = make(map[int]interface{})
					}
					macro.OrigTypeIds[m.Type][m.OrigId] = nil
					found = true
					break
				}
			}

			if !found {
				md.Macros = append(md.Macros, m)
			}

		case "INST2A03":
			//if !macrosDumped {
			//	macrosDumped = true
			//	for _, macro := range md.Macros {
			//		fmt.Println(macro)
			//	}
			//}
			inst, err := md.parseInstrument(line)
			if err != nil {
				return nil, fmt.Errorf("Error parsing instrument on line %d: %s", lnum+1, err)
			}
			md.Instruments = append(md.Instruments, inst)

		case "TRACK":
			if currentTrack != nil {
				md.Songs = append(md.Songs, currentTrack)
				//for _, f := range md.Songs.FramesNoise {
				//	if len(f) == 0 {

				//	}
				//}
			}

			id := 0
			if currentTrack != nil {
				id = currentTrack.Id + 1
			}

			currentTrack = &song{Id:id}
			matches := re_Track.FindSubmatch(line)
			if len(matches) != 5 {
				return nil, fmt.Errorf("Error parsing track on line %d: not enough matches. got %d expected 4 on %s", lnum+1, len(matches), line)
			}

			r, err := strconv.ParseInt(string(matches[1]), 10, 32)
			if err != nil {
				return nil, fmt.Errorf("Error parsing track Row value on line %d: %s", lnum+1, err)
			}

			s, err := strconv.ParseInt(string(matches[2]), 10, 32)
			if err != nil {
				return nil, fmt.Errorf("Error parsing track Speed value on line %d: %s", lnum+1, err)
			}

			t, err := strconv.ParseInt(string(matches[3]), 10, 32)
			if err != nil {
				return nil, fmt.Errorf("Error parsing track Tempo value on line %d: %s", lnum+1, err)
			}

			currentTrack.Rows = int(r)
			currentTrack.Speed = int(s)
			currentTrack.Tempo = int(t)

			currentTrack.Name  = string(matches[4])
			//currentTrack.Frames = 0

			currentTrack.FramesPulseA = frameList{}
			currentTrack.FramesPulseB = frameList{}
			currentTrack.FramesTriangle = frameList{}
			currentTrack.FramesNoise = frameList{}

			currentTrack.OrderPulseA = []int{}
			currentTrack.OrderPulseB = []int{}
			currentTrack.OrderTriangle = []int{}
			currentTrack.OrderNoise = []int{}

		case "ORDER":
			a, b, t, n, err := parseOrder(line)
			if err != nil {
				return nil, fmt.Errorf("Error parsing order on line %d: %s", lnum+1, err)
			}

			currentTrack.OrderPulseA = append(currentTrack.OrderPulseA, a)
			currentTrack.OrderPulseB = append(currentTrack.OrderPulseB, b)
			currentTrack.OrderTriangle = append(currentTrack.OrderTriangle, t)
			currentTrack.OrderNoise = append(currentTrack.OrderNoise, n)

		case "PATTERN":
			if currentTrack == nil {
				return nil, fmt.Errorf("Pattern line before track definition!")
			}

			currentTrack.FramesPulseA = append(currentTrack.FramesPulseA, frame{})
			currentTrack.FramesPulseB = append(currentTrack.FramesPulseB, frame{})
			currentTrack.FramesTriangle = append(currentTrack.FramesTriangle, frame{})
			currentTrack.FramesNoise = append(currentTrack.FramesNoise, frame{})

			id, err := strconv.ParseInt(string(line[bytes.Index(line, []byte(" "))+1:len(line)]), 10, 32)
			if err != nil {
				return nil, fmt.Errorf("Error parsing pattern Id on line %d: %s", lnum+1, err)
			}

			currentTrack.FramesPulseA[len(currentTrack.FramesPulseA)-1].PatternId = int(id)
			currentTrack.FramesPulseB[len(currentTrack.FramesPulseB)-1].PatternId = int(id)
			currentTrack.FramesTriangle[len(currentTrack.FramesTriangle)-1].PatternId = int(id)
			currentTrack.FramesNoise[len(currentTrack.FramesNoise)-1].PatternId = int(id)

		case "ROW":
			a, b, t, n, err := parseRow(line)
			if err != nil {
				return nil, fmt.Errorf("Error parsing pattern row on line %d: %s", lnum+1, err)
			}

			//fmt.Printf("ROW %q %q %q %q\n", a, b, t, n)

			currentTrack.FramesPulseA[len(currentTrack.FramesPulseA)-1].data = append(currentTrack.FramesPulseA[len(currentTrack.FramesPulseA)-1].data, a...)
			currentTrack.FramesPulseB[len(currentTrack.FramesPulseB)-1].data = append(currentTrack.FramesPulseB[len(currentTrack.FramesPulseB)-1].data, b...)
			currentTrack.FramesTriangle[len(currentTrack.FramesTriangle)-1].data = append(currentTrack.FramesTriangle[len(currentTrack.FramesTriangle)-1].data, t...)
			currentTrack.FramesNoise[len(currentTrack.FramesNoise)-1].data = append(currentTrack.FramesNoise[len(currentTrack.FramesNoise)-1].data, n...)
		}
	}

	if currentTrack != nil {
		md.Songs = append(md.Songs, currentTrack)
	}

	//fmt.Println(macros)
	fmt.Println(md)

	return md, nil
}

func parseRow(line []byte) ([]dataValue, []dataValue, []dataValue, []dataValue, error) {
	row := bytes.Split(line, []byte(":"))

	a, err := parseRowPulseTriangle(bytes.TrimSpace(row[1]))
	if err != nil {
		return nil, nil, nil, nil, err
	}

	b, err := parseRowPulseTriangle(bytes.TrimSpace(row[2]))
	if err != nil {
		return nil, nil, nil, nil, err
	}

	t, err := parseRowPulseTriangle(bytes.TrimSpace(row[3]))
	if err != nil {
		return nil, nil, nil, nil, err
	}

	n, err := parseRowNoise(bytes.TrimSpace(row[4]))
	if err != nil {
		return nil, nil, nil, nil, err
	}

	return a, b, t, n, nil
}

func parseRowPulseTriangle(col []byte) ([]dataValue, error) {
	items := bytes.Split(col, []byte(" "))

	note := items[0]
	ret := []dataValue{}
	foundFull := false
	for in, out := range noteReplacementsFull {
		if bytes.Equal(note, []byte(in)) {
			//if !bytes.Equal(out, []byte("Empty")) {
			//	fmt.Printf("found %s command\n", string(out))
			//}
			note = out
			foundFull = true
			ret = append(ret, dataCommand{Command: string(out)})
			break
		}
	}

	//ret := []dataValue{dataNote{Note:dataNote(string(note))}}

	other, err := parseRowNotNote(items)
	if err != nil {
		return nil, err
	}

	if len(other) != 0 {
		ret = append(ret, other...)
	}

	if !foundFull {
		for in, out := range noteReplacements {
			note = bytes.ReplaceAll(note, []byte(in), out)
		}

		ret = append(ret, newDataNote(note))
		//ret = append(ret, dataNote{Note:string(note)})
	}

	return ret, nil
}

func parseRowNoise(col []byte) ([]dataValue, error) {
	items := bytes.Split(col, []byte(" "))

	note := items[0]
	foundFull := false
	ret := []dataValue{}
	for in, out := range noteReplacementsFull {
		if bytes.Equal(note, []byte(in)) {
			//note = out
			foundFull = true
			ret = append(ret, dataCommand{Command:string(out)})
			//fmt.Println("found full on noise")
			break
		}
	}

	if !foundFull {
		val, err := strconv.ParseInt(string(note[0]), 16, 32)
		if err != nil {
			return nil, fmt.Errorf("Invalid value for noise: %q; %s", note[0], err)
		}

		ret = append(ret, dataNoise{Value:int(val)})
	}

	other, err := parseRowNotNote(items)
	if err != nil {
		return nil, err
	}

	if len(other) != 0 {
		ret = append(ret, other...)
	}

	return ret, nil
}

func parseRowNotNote(items [][]byte) ([]dataValue, error) {
	ret := []dataValue{}

	if !bytes.Equal(items[1], []byte("..")) {
		val, err := strconv.ParseInt(string(items[1]), 16, 32)
		if err != nil {
			return nil, fmt.Errorf("Error parsing instrument ID: %s", err)
		}

		inst, err := newDataInstrument(int(val))
		if err != nil {
			return nil, fmt.Errorf("Error adding new instrument: %s")
		}

		ret = append(ret, inst)
	}

	if !bytes.Equal(items[2], []byte(".")) {
		val, err := strconv.ParseInt(string(items[2]), 16, 32)
		if err != nil {
			return nil, fmt.Errorf("Error parsing volume value: %s", err)
		}
		ret = append(ret, newDataCommand("Volume", int(val)))
	}

	if !bytes.Equal(items[3], []byte("...")) {
		// First character is the command
		if cmd, ok := commands[items[3][0]]; ok {
			// Second and third are the argument(s)
			val, err := strconv.ParseInt(string(items[3][1:2]), 16, 32)
			if err != nil {
				return nil, fmt.Errorf("Error parsing command argument for %s: %s", cmd, err)
			}

			if cmd == "Skip" && val != 0 {
				fmt.Println("\n\nWARNING: SKIP TO ROW OTHER THAN ZERO\n\n")
			}

			ret = append(ret, newDataCommand(cmd, int(val)))
		}
	}
	return ret, nil
}

func parseOrder(line []byte) (int, int, int, int, error) {
	orders := bytes.Split(line[bytes.Index(line, []byte(":"))+2:len(line)], []byte(" "))

	a, err := strconv.ParseInt(string(orders[0]), 10, 32)
	if err != nil {
		return 0, 0, 0, 0, fmt.Errorf("Error parsing PulseA order from %q: %s", orders[0], err)
	}

	b, err := strconv.ParseInt(string(orders[1]), 10, 32)
	if err != nil {
		return 0, 0, 0, 0, fmt.Errorf("Error parsing PulseB order from %q: %s", orders[1], err)
	}

	t, err := strconv.ParseInt(string(orders[2]), 10, 32)
	if err != nil {
		return 0, 0, 0, 0, fmt.Errorf("Error parsing Triangle order from %q: %s", orders[2], err)
	}

	n, err := strconv.ParseInt(string(orders[3]), 10, 32)
	if err != nil {
		return 0, 0, 0, 0, fmt.Errorf("Error parsing Noise order from %q: %s", orders[3], err)
	}

	return int(a), int(b), int(t), int(n), nil
}

func parseMacro(line []byte) (*macro, error) {
	line = re_spaces.ReplaceAll(line, []byte(" "))
	cols := bytes.SplitN(line, []byte(" "), 7)

	if string(cols[0]) != "MACRO" {
		return nil, fmt.Errorf("Not a macro line")
	}

	t, err := strconv.ParseInt(string(cols[1]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing macro Type: %s", err)
	}

	id, err := strconv.ParseInt(string(cols[2]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing macro Id: %s", err)
	}

	l, err := strconv.ParseInt(string(cols[3]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing macro Loop: %s", err)
	}

	r, err := strconv.ParseInt(string(cols[4]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing macro Release: %s", err)
	}

	data := []uint8{}

	for _, d := range bytes.Split(cols[6][2:len(cols[6])], []byte(" ")) {
		val, err := strconv.ParseInt(string(d), 10, 32)
		if err != nil {
			return nil, fmt.Errorf("Error parsing data: %s", err)
		}

		data = append(data, uint8(val))
	}

	typeIds := make(map[int]map[int]interface{})
	typeIds[int(t)] = make(map[int]interface{})
	typeIds[int(t)][int(id)] = nil

	return &macro{
		Type: int(t),
		OrigId: int(id),
		OrigTypeIds: typeIds,

		Loop: uint8(l),
		Release: uint8(r),
		Length: uint8(len(data)),
		Data: data,
	}, nil
}

func (md *MusicData) parseInstrument(line []byte) (*instrument, error) {
	line = re_spaces.ReplaceAll(line, []byte(" "))
	cols := bytes.SplitN(line, []byte(" "), 8)

	if string(cols[0]) != "INST2A03" {
		return nil, fmt.Errorf("Instrument %q not supported", cols[0])
	}

	id, err := strconv.ParseInt(string(cols[1]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing instrument Id: %s", err)
	}

	vol, err := strconv.ParseInt(string(cols[2]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing instrument Volume: %s", err)
	}

	volMacro, err := md.findMacro(0, int(vol))
	if err != nil {
		return nil, fmt.Errorf("Didn't find volume macro: %s", err)
	}

	arp, err := strconv.ParseInt(string(cols[3]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing instrument Arpeggio: %s", err)
	}

	arpMacro, err := md.findMacro(1, int(arp))
	if err != nil {
		return nil, fmt.Errorf("Didn't find Arpeggio macro: %s", err)
	}

	pitch, err := strconv.ParseInt(string(cols[4]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing instrument Pitch: %s", err)
	}

	pitchMacro, err := md.findMacro(2, int(pitch))
	if err != nil {
		return nil, fmt.Errorf("Didn't find Pitch macro: %s", err)
	}

	hipitch, err := strconv.ParseInt(string(cols[5]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing instrument HiPitch: %s", err)
	}

	hipitchMacro, err := md.findMacro(3, int(hipitch))
	if err != nil {
		return nil, fmt.Errorf("Didn't find HiPitch macro: %s", err)
	}

	duty, err := strconv.ParseInt(string(cols[6]), 10, 32)
	if err != nil {
		return nil, fmt.Errorf("Error parsing instrument Duty: %s", err)
	}

	dutyMacro, err := md.findMacro(4, int(duty))
	if err != nil {
		return nil, fmt.Errorf("Didn't find Duty macro: %s", err)
	}

	inst := &instrument{
		Name: strings.Trim(string(cols[7]), `"`),
		Id: int(id),

		Volume: volMacro,
		Arpeggio: arpMacro,
		Pitch: pitchMacro,
		HiPitch: hipitchMacro,
		Duty: dutyMacro,
	}

	instruments[int(id)] = inst

	return inst, nil
}
