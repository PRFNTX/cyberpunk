extends Node2D

export(bool) var slideInLeft = false
export(bool) var slideInRight = false
export(NodePath) var next = null
export(bool) var hasText = false
export(bool) var hasOption = false
export(Dictionary) var optionsNext = {
	'yes': null,
	'no': null,
	'...': null,
}
var onNext = null

func _ready():
	if hasText:
		showText()
	elif hasOption:
		showOption()
	else:
		nextFrame()

func showText():
	$FrameText.show()
	if hasOption:
		$FrameText.setOnComplete(funcref(self, 'showOption'))
	else:
		$FrameText.setOnComplete(funcref(self, 'nextFrame'))
	$FrameText.start()

func showOption():
	$FrameOptions.show()
	$FrameOptions.setOnComplete(funcref(self, 'nextFrame'))

func enterFrame(_onNext, _next):
	if slideInLeft:
		pass
	if slideInRight:
		pass
	if next == null:
		next = _next
	onNext = _onNext

func nextFrame(option=null):
	onNext.call_func(option)