extends Node2D

export(Texture) var image = null
export(NodePath) var polygonNode = null

export(int) var threads = 0
export(int) var core = 0
export(int) var memory = 0

export(int, "processor", "memory", "motherboard", "interface", "module") var slot = 0

signal release
signal grabbed

func _ready():
	$image.texture = image
	get_node(polygonNode).connect("input_event", self, "on_polygon_input_event")

var dragging = false
var grabPoint = Vector2(0,0)

func _input(event):
	if dragging:
		if event is InputEventMouseMotion:
			position += event.relative
		elif event is InputEventMouseButton and not event.pressed and event.button_index == BUTTON_LEFT:
			if dragging:
				get_tree().set_input_as_handled()
			dragging = false
			emit_signal('release', self)

func on_polygon_input_event(viewport, event, intShape):
	if not get_tree().is_input_handled():
		if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
			if not dragging:
				get_tree().set_input_as_handled()
			dragging = true
			grabPoint = event.position - position
			emit_signal('grabbed', self)
		#elif event is InputEventMouseButton and not event.pressed and event.button_index == BUTTON_LEFT:
		#	if dragging:
		#		get_tree().set_input_as_handled()
		#	dragging = false
		#	emit_signal('release', self)
