extends Node

var gameState = {}
var scenes = [
	{
		'trigger': 'optionResult',
		'sceneResource': preload("res://NarrativeScenes/DemoScene.tscn"),
		'keys': ['optionResult'],
	},
]

var sceneSaver = []

func loadNextScene():
	for scene in scenes:
		if not gameState.keys().has(scene.trigger):
			loadScene(scene.sceneResource)

func loadScene(scene):
	var instancedScene = scene.instance()
	get_tree().get_root().get_children()[0].queue_free()
	get_tree().get_root().add_child(instancedScene)
	instancedScene.start()

func resolveScene(flags):
	for key in flags:
		gameState[key] = flags[key]
	#save state
	loadNextScene()