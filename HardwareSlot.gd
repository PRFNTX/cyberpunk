extends Node2D

export(int, "core", "something", "memory", "module") var slotType = 0
export(Color) var good = null
export(Color) var bad = null
export(Color) var nop = null

var textures = [
	load("res://Assets/data-blue.png"),
	load("res://Assets/directory.png"),
	load("res://Assets/process-blue.png"),
	load("res://Assets/nework.png"),
]

var connectedPart = null

signal partConnected
signal partDisconnected
signal hovered

func _ready():
	$typeIcon.texture = textures[slotType]

var acceptReady = null
func wrong_type():
	modulate = bad
	if (acceptReady == null):
		acceptReady = false
		emit_signal('hovered')

func correct_type():
	modulate = good
	if (acceptReady == null):
		acceptReady = true
		emit_signal('hovered', self)

func no_type():
	modulate = nop

func reset():
	modulate = nop
	acceptReady = null

func disconnect_part(part):
	if not connectedPart == null:
		connectedPart = null
		emit_signal('partDisconnected', self)
		part.disconnect('grabbed', self, 'disconnect_part')

func accept_part(part):
	if connectedPart == null:
		part.set_global_position(position)
		connectedPart = part
		emit_signal("partConnected", part)
		part.connect('grabbed', self, 'disconnect_part')

func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):
	var part = area.get_parent()
	part.connect('release', self, 'accept_part')
	var type = part.slot
	if type == slotType and connectedPart == null:
		correct_type()
	elif connectedPart == null:
		wrong_type()

func _on_Area2D_area_shape_exited(area_id, area, area_shape, self_shape):
	var part = area.get_parent()
	part.disconnect('release', self, 'accept_part')
	if connectedPart == null:
		reset()
