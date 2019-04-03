extends Node2D

var rig
var gameNode
var entryNode

func _ready():
	gameNode = get_tree().get_node('GameNode')
	rig = gameNode.character.rig
	

func startHack(entryNode):
	pass