package main

import (
	"fmt"
	"strings"
	"strconv"
)

var instruments map[int]*instrument = map[int]*instrument{}

type MusicData struct {
	Songs []*song
	Instruments []*instrument
	usedInstruments map[int]bool
	Macros []*macro
	usedMacros map[int]bool
}

func (md *MusicData) useInstruments(list []int) {
	for _, id := range list {
		md.usedInstruments[id] = true
	}
}

func (md *MusicData) String() string {
	songs := []string{}
	for _, s := range md.Songs {
		songs = append(songs, s.String())
	}

	inst := []string{}
	for _, i := range md.Instruments {
		inst = append(inst, i.String())
	}

	return strings.Join(songs, "\n") + "\n>> Instruments\n" + strings.Join(inst, "\n")
}

/*
	song
*/

type song struct {
	Id int
	Name string
	Rows int
	Speed int
	Tempo int
	//Frames int

	OrderPulseA []int
	OrderPulseB []int
	OrderTriangle []int
	OrderNoise []int

	FramesPulseA frameList
	FramesPulseB frameList
	FramesTriangle frameList
	FramesNoise frameList
}

func (s song) Label() string {
	return fmt.Sprintf("song_%d", s.Id)

}

func (s *song) String() string {
	return fmt.Sprintf("%s; frame count: %d", s.Name, len(s.FramesPulseA))
}

/*
	frames
*/


type frameList []frame

type frame struct {
	PatternId int
	data []dataValue
}

func (f frame) Asm() string {
	data := []string{}
	for _, d := range f.data {
		data = append(data, d.Asm())
	}

	return fmt.Sprintf("\t.byte %s\n", strings.Join(data, ", "))
}

/*
	Song data
*/

type DataType int
const (
	DT_Instrument DataType = iota
	DT_Command
	DT_Note
	DT_Noise
)

type dataValue interface {
	Type() DataType
	String() string
	Asm() string
}

type dataInstrument struct {
	Instrument *instrument
	OrigId int
}

func newDataInstrument(id int) (dataValue, error) {
	// TODO: find and populate Instrument field
	inst, ok := instruments[id]
	if !ok {
		return nil, fmt.Errorf("Instrument with ID %d not found", id)
	}

	return dataInstrument{
		OrigId: id,
		Instrument: inst,
	}, nil
}

func (di dataInstrument) Type() DataType {
	return DT_Instrument
}

func (di dataInstrument) String() string {
	if di.Instrument == nil {
		return "nil instrument object.  This should never happen."
	}

	return fmt.Sprintf("{Instrument %q OrigId:%d}", di.Instrument.Name, di.OrigId)
}

func (di dataInstrument) Asm() string {
	if di.Instrument == nil {
		return ""
	}

	return fmt.Sprintf("SoundEngine::CMD::Instrument, %d", di.Instrument.Id)
}

type dataCommand struct {
	Command string
	Args int
}

func newDataCommand(cmd string, args int) dataValue {
	return dataCommand{Command: cmd, Args: args}
}

func (dc dataCommand) Type() DataType {
	return DT_Command
}

func (dc dataCommand) String() string {
	return fmt.Sprintf("{Command %q Args:%X}", dc.Command, dc.Args)
}

func (dc dataCommand) Asm() string {
	switch dc.Command {
	case "Halt", "Release":
		return fmt.Sprintf("SoundEngine::CMD::%s", dc.Command)
	}
	return fmt.Sprintf("SoundEngine::CMD::%s, $%02X", dc.Command, dc.Args)
}

type dataNote struct {
	Note string
}

func newDataNote(raw []byte) dataNote {
	oct := raw[len(raw)-1]
	val, err := strconv.ParseInt(string(oct), 10, 32)
	if err != nil {
		panic("WRONG OCTIVE")
	}

	return dataNote{Note: fmt.Sprintf("%s%d", string(raw[0:len(raw)-1]), val+1)}
}

func (dn dataNote) Type() DataType {
	return DT_Note
}

func (dn dataNote) String() string {
	if strings.HasPrefix(dn.Note, "$") {
		return fmt.Sprintf("{Noise Note %s}", dn.Note)
	}
	return fmt.Sprintf("{Note %s}", dn.Note)
}

func (dn dataNote) Asm() string {
	return fmt.Sprintf("SoundEngine::Note::%s", dn.Note)
}

type dataNoise struct {
	Value int
}

func (dn dataNoise) Type() DataType {
	return DT_Noise
}

func (dn dataNoise) String() string {
	return fmt.Sprintf("{Noise %d}", dn.Value)
}

func (dn dataNoise) Asm() string {
	return fmt.Sprintf("$%02X", dn.Value)
}

/*
	Instruments
*/

type instrument struct {
	Name string
	Id int
	Used bool

	Volume *macro
	Arpeggio *macro
	Pitch *macro
	HiPitch *macro
	Duty *macro
}

func (inst instrument) Label() string {
	return fmt.Sprintf("inst_%d", inst.Id)
}

func (inst instrument) String() string {
	return inst.Name
}

/*
	Macros
*/

type macro struct {
	Type int
	OrigId int
	Index int
	Used bool

	// key: type
	// val: id
	OrigTypeIds map[int]map[int]interface{}

	Loop uint8
	Release uint8
	Length uint8
	Data []uint8
}

func (m macro) Label() string {
	return fmt.Sprintf("macro_%d_%d", m.Type, m.OrigId)
}

func (m macro) String() string {
	tids := []string{}
	for t, val := range m.OrigTypeIds {
		for v, _ := range val {
			tids = append(tids, fmt.Sprintf("%d.%d", t, v))
		}
	}
	return fmt.Sprintf("{macro T:%d ID:%d Used:%t Dups:[%s] Data:%v}", m.Type, m.OrigId, m.Used, strings.Join(tids, ", "), m.Data)
}

// FIXME: this doest't work for some reason
func (m *macro) Equals(other *macro) bool {
	//fmt.Println("equal check", m, "vs", other)
	if m.Loop != other.Loop {
		//fmt.Printf("loop mismatch: %d vs %d\n", m.Loop, other.Loop)
		return false
	}

	if m.Release != other.Release {
		//fmt.Printf("release mismatch: %d vs %d\n", m.Release, other.Release)
		return false
	}

	if m.Length != other.Length {
		//fmt.Printf("length mismatch: %d vs %d\n", m.Length, other.Length)
		return false
	}

	if len(m.Data) != len(other.Data) {
		return false
	}

	for i := 0; i < len(m.Data); i++ {
		if m.Data[i] != other.Data[i] {
			return false
		}
	}

	//fmt.Printf("found dup macro %d.%d vs %d.%d\n", m.Type, m.OrigId, other.Type, other.OrigId)

	return true
}

func (m macro) DataString() string {
	data := []string{}
	for _, d := range m.Data {
		data = append(data, fmt.Sprintf("%d", d))
	}
	return strings.Join(data, ", ")
}

func (md *MusicData) findMacro(t, id int) (*macro, error) {
	// no macro assigned
	if id == -1 {
		return nil, nil
	}

	for _, m := range md.Macros {
		// does the macro belong to the required type?
		_, ok := m.OrigTypeIds[t]
		if !ok {
			continue
		}

		// does the macro have the requried (de-duplicated) ID?
		_, ok = m.OrigTypeIds[t][id]
		if ok {
			m.Used = true
			return m, nil
		}
	}

	return nil, fmt.Errorf("Macro with Type %d and ID %d does not exist!", t, id)
}
