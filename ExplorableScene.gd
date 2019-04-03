extends Node2D

var state = {}
var results = []


func _ready():
	$frames.get_children()[0].show()
	$frames.get_children()[0].start()

func sendResult(item):
	results.append(
		{
			'type': item.key,
			'value': item.value,
		}
	)

func endScene():
	pass