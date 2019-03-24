extends Node

#var nodeSource = get_tree().get_node('/root/node_loader')
var nodeSource

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func boot(schema):
	for node in schema.values():
		pass
