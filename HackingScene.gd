extends Node2D

var dirs = [
	Vector2(0, -150),
	Vector2(150, 0),
	Vector2(0, 150),
	Vector2(-150, 0),
]
var rigScene = null

signal nodeClicked

func _ready():
	for child in get_children():
		child.connect('nodeClicked', self, 'child_clicked')

func child_clicked(node):
	emit_signal("nodeClicked", node)