extends Node2D

var availablePrograms = []
var activePrograms = [
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
]

var programSlotScene = preload("res://ProgramSlot.tscn")

var selectedSlot = null

func _ready():
	var gameNode = get_tree().get_root().get_node('GameNode')
	#availablePrograms = gameNode.availablePrograms
	var programNode = load('res://ProgramNode.tscn')
	var icon = load('res://Assets/directory.png')
	availablePrograms = gameNode.inventory.programs
	
	for program in gameNode.activeRig.memory:
		var oneProgramSlot = programSlotScene.instance()
		$activePrograms.add_child(oneProgramSlot)
		oneProgramSlot.position = $p1.position + (program * ($pdx.position - $p1.position))
		oneProgramSlot.connect('select_slot', self, 'selectSlot')
	for programNumber in availablePrograms.size():
		var oneProgram = availablePrograms[programNumber]
		$availablePrograms.add_child(oneProgram)
		oneProgram.get_node('icon').texture = icon
		oneProgram.position = (
			$start.position
				+ programNumber%6 * ($dx.position - $start.position)
				+ floor(programNumber/6) * ($dy.position - $start.position)
		)
		oneProgram.connect('program_clicked', self, 'selectProgram')

func selectProgram(program):
	selectedSlot.loadProgram(program)
	activePrograms[$activePrograms.get_children().find(selectedSlot)] = program

func selectSlot(slot):
	for programSlot in $activePrograms.get_children():
		if programSlot != slot:
			programSlot.set_selected(false)
	selectedSlot = slot