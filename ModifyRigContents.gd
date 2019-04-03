extends Node2D

var gameNode

func _ready():
	gameNode = get_tree().get_root().get_node("/root/GameNode")
	$motherboard.connect('component_added', self, 'on_component_changed')
	var posSpace = $partsBottomRight.position - $partsTopLeft.position
	for part in gameNode.inventory.rigParts:
		var onePart = part.instance()
		$partsPool.add_child(onePart)
		onePart.position = Vector2(randi()%int(posSpace.x), randi()%int(posSpace.y))

func on_component_changed(oldComponent, newComponent):
	#remove old component stats
	#add new component stats
	#modify stats
	pass

