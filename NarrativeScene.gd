extends Node2D

var sceneGlobals = {
	'optionId': 'optionResult',
}

var frames = []
var optionalFrames = [] # array of nodes which optional frames as children
var activeFrame = 0
var shownFrame

func _ready():
	for frame in get_children():
		if frame is Node2D:
			frames.append(frame)
		else:
			optionalFrames.append(frame)

func start():
	if frames.size() - 1 >= activeFrame:
		enterFrame()

func shedDots(path):
	var splitString = path.get_concatenated_subnames().split("/")
	var result = ""
	for item in splitString:
		if item != "..":
			result.append(item+'/')
	return 

func _findChildIndex(node):
	var childToFind = node
	var index = frames.find(childToFind)
	return index

func enterFrame(frame=null):
	if frame == null:
		shownFrame = frames[activeFrame]
	else:
		shownFrame = frame
	shownFrame.enterFrame(funcref(self, 'resolveFrame'))

func resolveFrame(option, defaultNext):
	if option == null:
		nextFrame(defaultNext)
	else:
		sceneGlobals[shownFrame.optionId] = option.flag
		if shownFrame.optionsNext[option.flag] != null:
			nextFrame(shownFrame.optionsNext[option.flag])
		else:
			nextFrame(defaultNext)

func nextFrame(next = null):
	shownFrame.hide()
	if next == null:
		activeFrame += 1
		if activeFrame >= frames.size() - 1:
			endScene()
		else:
			enterFrame()
	else:
		var sceneIndex = _findChildIndex(next)
		if sceneIndex >= 0:
			activeFrame = sceneIndex
			enterFrame()
		elif activeFrame >= frames.size() - 1:
			endScene()
		else:
			enterFrame(next)

func endScene():
	#add sceneGlobals to globals and resolve
	#pass to next scene
	#all this will be in a more global file
	print(sceneGlobals)