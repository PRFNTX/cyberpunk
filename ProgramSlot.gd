extends Node2D

var selected = false setget set_selected
var loadedProgram = null

signal select_slot

func set_selected(val):
	if val:
		$selected.show()
	else:
		$selected.hide()
	selected = val

func loadProgram(program):
	loadedProgram = program
	$icon.texture = program.get_node('icon').texture

func _on_Panel_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		selected = true
		$selected.show()
		emit_signal('select_slot', self)