extends Node2D

var paths = []
export(Array, Color) var userColors = [Color("#0985c8"), Color('#3ac302'), Color('#cbd60c'), Color('#ed4d07')]
export(Array, Color) var encryptionColors = [Color("#0985c8"), Color('#3ac302'), Color('#cbd60c'), Color('#ed4d07')]
export(int, 'Guest', "User", "Admin", "Root") var priviledges = 0
export(int, 'directory', 'cache', 'process') var type = 0
export(int, 'None', "Basic", "Standard", "Advanced", "Military") var encryption = 0
#export(Array, NodePath) var subdirectories = []
signal nodeClicked

func _ready():
	paths = [
		$up,
		$right,
		$down,
		$left,
	]
	$Local/body.color = userColors[priviledges]
	$Local/encryption.color = encryptionColors[encryption]
	for child in get_children():
		child.connect('nodeClicked', self, 'child_clicked')

func child_clicked(node):
	emit_signal("nodeClicked", node)

func get_priviledges():
	return 3

func _draw():
	var children = get_children()
	for index in range(1, get_child_count()):
		if children[index].get_name() == 'admin' and get_priviledges() >= 2:
			var endpos = $Local/endLine.position + (children[index].get_node("Local/startLine").get_global_position() - $Local/endLine.get_global_position())
			draw_line($Local/endLine.position, endpos, Color(255,255,255), 2)
		elif children[index].get_name() == 'root' and get_priviledges() >= 3:
			var endpos = $Local/endLine.position + (children[index].get_node("Local/startLine").get_global_position() - $Local/endLine.get_global_position())
			draw_line($Local/endLine.position, endpos, Color(255,255,255), 2)
		elif children[index].get_name() == 'guest' and get_priviledges() >= 1:
			var endpos = $Local/endLine.position + (children[index].get_node("Local/startLine").get_global_position() - $Local/endLine.get_global_position())
			draw_line($Local/endLine.position, endpos, Color(255,255,255), 2)
		else:
			var endpos = $Local/startLine.position + (children[index].get_node("Local/endLine").get_global_position() - $Local/startLine.get_global_position())
			draw_line($Local/startLine.position, endpos, Color(255,255,255), 2)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		emit_signal("nodeClicked", self)
