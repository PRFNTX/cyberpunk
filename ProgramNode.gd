extends Node2D

export(PackedScene) var programScene = null
export(Texture) var icon = null

signal program_clicked

func _ready():
	$icon.texture = icon

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and not event.pressed and event.button_index == BUTTON_LEFT:
		emit_signal('program_clicked', self)
