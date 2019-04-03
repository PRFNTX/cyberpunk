extends Node2D

var scrollUp = false
var scrollDown = false
var scrollLeft = false
var scrollRight = false

export(NodePath) var hackScene = null

var selectedNode = null
var selectedThread = 0

func startHack():
	pass

var decks = [
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
]

var programs = [
	null,
	null,
	null,
	null,
]

func runProgram(program, target):
	var slot = selectedThread
	if programs[slot] == null:
		programs[slot] = program
		print(programs[slot])
		print("run " + str(target))
		#program.run(target)
	elif programs[slot].complete:
		#programs[slot].endProgram()
		programs[slot] = program
		#program.run(target)
	print(programs[slot])

var readyTerminate = -1
func terminateThread(thread):
	terminateProgram(thread)

func terminateProgram(slot):
	print("TERMINATE "+ str(slot))
	#programs[slot].terminate()

func programProgress(delta):
	for program in programs:
		program.advance(delta)














var hackNode = null

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	if hackScene != null:
		hackNode = get_node(hackScene)
		hackNode.rigScene = self
		hackNode.connect('nodeClicked', self, 'child_clicked')

func child_clicked(node):
	selectedNode = node

func _input(event):
	if event.is_action_released('program1'):
		runProgram(1, selectedNode)
	if event.is_action_released('program2'):
		runProgram(2, selectedNode)
	if event.is_action_released('program3'):
		runProgram(3, selectedNode)
	if event.is_action_released('program4'):
		runProgram(4, selectedNode)
	if event.is_action_released('program5'):
		runProgram(5, selectedNode)
	if event.is_action_released('program6'):
		runProgram(6, selectedNode)
	if event.is_action_released('program7'):
		runProgram(7, selectedNode)
	if event.is_action_released('program8'):
		runProgram(8, selectedNode)
	if event.is_action_pressed('terminate_program'):
		if readyTerminate == selectedThread:
			terminateThread(selectedThread)
		else:
			readyTerminate = selectedThread

const moveRate = 600
func _process(delta):
	if hackScene != null:
		if selectedNode:
			$target.set_global_position(selectedNode.get_global_position())
		if scrollUp:
			hackNode.position.y += delta*moveRate
		if scrollDown:
			hackNode.position.y -= delta*moveRate
		if scrollLeft:
			hackNode.position.x += delta*moveRate
		if scrollRight:
			hackNode.position.x -= delta*moveRate
		
	#programProgress()
	#systemProgress()
	#rigEffects()

func _on_ScrollUp_mouse_entered():
	scrollUp = true


func _on_ScrollUp_mouse_exited():
	scrollUp = false


func _on_ScrollRight_mouse_entered():
	scrollRight = true


func _on_ScrollRight_mouse_exited():
	scrollRight = false


func _on_ScrollLeft_mouse_entered():
	scrollLeft = true


func _on_ScrollLeft_mouse_exited():
	scrollLeft = false


func _on_ScrollDown_mouse_entered():
	scrollDown = true


func _on_ScrollDown_mouse_exited():
	scrollDown = false


func _on_Panel1_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		selectThread(0)

func _on_Panel2_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		selectThread(1)

func _on_Panel3_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		selectThread(2)

func _on_Panel4_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		selectThread(3)


func selectThread(threadNum):
	selectedThread = threadNum
	var children = $Threads.get_children()
	for item in $Threads.get_child_count():
		if item == threadNum:
			children[item].get_node('selected').show()
		else:
			children[item].get_node('selected').hide()