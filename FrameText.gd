extends Node2D

var frameName = ""
var textArray
var current = 0
var next = false
var onComplete = null

func reset():
	textArray = []
	frameName = ""
	current = 0
	next = false
	onComplete = null
	textCounter = 0.0
	charsShown = 0
	charsToShow = 0
	advanceReady = false
	$textDisplay.text = ""

func _ready():
	set_process(false)
	set_process_input(false)

func init():
	$textDisplay.text = ""
	$Name.text = frameName
	set_process(false)
	set_process_input(false)

func pause():
	set_process(false)
	set_process_input(false)

func start():
	set_process(true)
	set_process_input(true)

func setOnComplete(_onComplete = null):
	onComplete = _onComplete

func advance():
	if current >= textArray.size() - 1:
		hide()
		onComplete.call_func()
		pause()
	else:
		next = true
		$completeReady.show()
		$nextReady.hide()

func _input(event):
	if event.is_action('advance') and event.is_action_released('advance'):
		if advanceReady:
			advance()
		else:
			charsShown = textArray[current].length() - 1

var textRate = 0.08 #chars/s
var textCounter = 0.0
var charsShown = 0
var charsToShow = 0
var advanceReady = false
func _process(delta):
	if delta:
		if next:
			next = false
			advanceReady = false
			current += 1
			charsToShow = textArray[current].length()
			charsShown = 0
			$textDisplay.text = ""
		else:
			textCounter += delta
			if textCounter >= textRate:
				textCounter = 0
				charsShown += 1
				$textDisplay.text = textArray[current].left(charsShown)
			if charsShown >= textArray[current].length() - 1:
				advanceReady = true
		if advanceReady:
			if current >= textArray.size() -1:
				$completeReady.show()
				$nextReady.hide()
			else:
				$completeReady.hide()
				$nextReady.show()
		else:
			$completeReady.hide()
			$nextReady.hide()