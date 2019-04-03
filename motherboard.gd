extends Node2D

enum types {
	CORE,
	MEMORY,
	MODULE,
}

signal component_added

export(int) var cores = 1
export(int) var memory = 1
export(int) var modules = 1

onready var motherboardSlot = load("res://HardwareSlot.tscn")
onready var gameNode = get_tree().get_root().get_node("/root/GameNode")

var slots = {
}

var dx = 120
var dy = 120

func _ready():
	for coreNum in gameNode.activeRig.coreSlots:
		var oneCore =motherboardSlot.instance()
		oneCore.slotType = 0
		$slots.add_child(oneCore)
		oneCore.position = Vector2(dx, dy*(1+coreNum))
	for memoryNum in gameNode.activeRig.memorySlots:
		var oneCore =motherboardSlot.instance()
		oneCore.slotType = 1
		$slots.add_child(oneCore)
		oneCore.position = Vector2(dx*2, dy*(1+memoryNum))
	for moduleNum in gameNode.activeRig.moduleSlots:
		var oneCore =motherboardSlot.instance()
		oneCore.slotType = 2
		$slots.add_child(oneCore)
		oneCore.position = Vector2(dx*3, dy*(1+moduleNum))
	for child in $slots.get_children():
		child.connect('partConnected', self, 'part_connected')
		child.connect('partDisconnected', self, 'part_disconnected')
	#for component in components:
	#	var newComponent = component['node'].instance()
	#	newComponent.position = component.position
	#	newComponent.type = component.type
	#	add_child(newComponent)
	#	newComponent.connect('dropped_component', self, 'connect_component')

func part_disconnected(part):
	print('it is disconnected')

func part_connected(part):
	print('it is connected')

func hover_child(child):
	for oneChild in $slots.get_children():
		if not child == oneChild:
			oneChild.no_type()

func connect_component(componentSlot, component):
	componentSlot.add_child(component)
	component.position = Vector2(0, 0)
	var oldComponent = slots[componentSlot]
	slots[componentSlot] = component
	emit_signal('component_added', oldComponent, component)
