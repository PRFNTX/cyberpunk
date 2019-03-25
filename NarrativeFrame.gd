extends Node2D

export(bool) var loadExportsFromNode = false

export(NodePath) var defaultNext = null
## image exports
export(Texture) var imageLeft
export(Texture) var imageRight
export(bool) var slideInLeft = false
export(bool) var slideInRight = false

## text exports
export(bool) var hasText = false
export(String) var frameName = 'Mr. Text Robot'
export(Array, String) var textArray = ['enter text here', 'this is text number 2']

## option exports
export(bool) var hasOption = false
export(Dictionary) var optionsNext = {
	'accept': null,
}
export(String) var prompt = "Prompt goes here"
export(String) var optionId = "choiceEdgy"
export(Array, Dictionary) var options = [
	{
		'text': 'I accept',
		'flag': 'accept',
	},
]
export(PackedScene) var optionScene = load('res://FrameOptions.gd')

var onNext = null ##funcref
var next = null ## NodePath

func loadExports():
	var exportNode = get_node(name + 'Exports')
	defaultNext = exportNode.defaultNext
	## image exports
	imageLeft = exportNode.imageLeft
	imageRight = exportNode.imageRight
	slideInLeft = exportNode.slideInLeft
	slideInRight = exportNode.slideInRight

	## text exports
	hasText = exportNode.hasText
	frameName = exportNode.frameName
	textArray = exportNode.textArray

## option exports
	hasOption = exportNode.hasOption
	optionsNext = exportNode.optionsNext
	for key in optionsNext.keys():
		optionsNext[key] = getNodeFromNodePath(optionsNext[key])
	prompt = exportNode.prompt
	optionId = exportNode.optionId
	options = exportNode.options


func _ready():
	if loadExportsFromNode:
		loadExports()
	else:
		for key in optionsNext.keys():
			optionsNext[key] = getNodeFromNodePath(optionsNext[key])

## SPRITE FUNCS

func _initSprites():
	$Left.texture = imageLeft
	$Right.texture = imageRight
	if slideInLeft:
		pass
	if slideInRight:
		pass

## TEXT FUNCS

func _initText():
	print(textArray)
	if hasText:
		$FrameText.frameName = frameName
		$FrameText.textArray = textArray
		$FrameText.init()

func showText():
	$FrameText.show()
	if hasOption:
		$FrameText.setOnComplete(funcref(self, 'showOption'))
	else:
		$FrameText.setOnComplete(funcref(self, 'nextFrame'))
	$FrameText.start()

#### OPTION FUNCS

func _initOptions():
	if hasOption:
		$FrameOptions/Prompt.text = prompt
		var index = 0
		for option in options:
			var oneOption = optionScene.instance()
			$FrameOptions/options.add_child(oneOption)
			oneOption.index = index
			oneOption.setText(option.text)
			oneOption.setOnSelect(funcref(self, 'makeSelection'))
			oneOption.rect_position.y += oneOption.rect_size.y * index
			index += 1

func showOption():
	$FrameOptions.show()

func makeSelection(index):
	nextFrame(options[index])


## FRAME CONTROL FUNCTIONS

func enterFrame(_onNext):
	show()
	onNext = _onNext
	_initSprites()
	_initText()
	_initOptions()
	if hasText:
		showText()
	elif hasOption:
		showOption()
	else:
		nextFrame()

func getNodeFromNodePath(path):
	if path == null:
		return null
	if loadExportsFromNode:
		return get_node(name + "Exports").get_node(path)
	return get_node(path)

func nextFrame(option=null):
	hide()
	onNext.call_func(option, getNodeFromNodePath(defaultNext))