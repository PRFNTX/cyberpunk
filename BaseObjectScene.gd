extends Node2D

export(Texture) var image = null
export(Array, Dictionary) var objectResults = [
	{
		'key': 'one',
		'result': ['This is the result for one'],
		'name': 'Object Name',
		'value': 'this one',
		'goto': null,
		'exit': false,
	},
]

export(Dictionary) var default = {
	'key': null,
	'result': ['I\'ve already inspected that'],
	'name': 'Object Name',
	'value': null,
}

var stateObject = null

func _ready():
	$sprite.texture = image


var primed = false
func _on_clickable_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and not stateObject.paused:
		if event.is_action_pressed('advance'):
			primed = true
		elif event.is_action_released("advance"):
			getResultFromState()

func getResultFromState():
	for item in objectResults:
		if not stateObject.state.keys().has(item.key):
			stateObject.state[item.key] = item.value
			return stateObject.sendResult(item)
	return stateObject.sendResult(default)