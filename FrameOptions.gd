extends Node2D

var prompt = "Prompt goes here"
var optionId = ""
var options = []
var optionScene = load('res://FrameOptions.gd')
var onComplete = null

func _ready():
	var index = 0
	for option in options:
		var oneOption = optionScene.instance()
		$options.add_child(oneOption)
		oneOption.index = index
		oneOption.setText(option.text)
		oneOption.setOnSelect(funcref(self, 'makeSelection'))
		oneOption.rect_position.y += oneOption.rect_size.y * index
		index += 1

func makeSelection(index):
	onComplete.call_func(options[index])

func setOnComplete(_onComplete):
	onComplete = _onComplete