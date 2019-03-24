extends Node2D
class thing:
	func get_directory():
		return "root"

var textValue = ""
var commandValue = ""
onready var directory = thing.new() #node
const commandIcon = "$"
var previousCommands = [""]
var commandPointer = 0

func _ready():
	setCommandLine()

func setCommandLine(command=""):
	_on_command_text_changed(directory.get_directory() + commandIcon + " " + command)

func getLineCommand(line):
	var thinger = line.right(min(line.find(commandIcon)+2, line.length()))
	print(line)
	print(line.find(commandIcon))
	return thinger

func _on_command_text_changed(new_text):
	if not new_text == textValue:
		var newCommand = getLineCommand(new_text)
		commandValue = newCommand
		textValue = directory.get_directory() + commandIcon + " " + newCommand
		$command.text = textValue
		if $command.caret_position < $command.text.find(commandIcon) + 1:
			$command.caret_position = $command.text.length()

func _on_command_text_entered(new_text):
	print('asdasd')
	var newCommand = getLineCommand(new_text)
	if previousCommands.size() == 1 or (not newCommand == "" and not previousCommands[1] == newCommand):
		previousCommands.insert(1, newCommand)
	print(previousCommands)
	commandPointer = 0
	addOutputLine(new_text)
	setCommandLine()

func addOutputLine(line):
	var out = $stdOut
	var currentLine = out.get_line_count()
	out.cursor_set_line(currentLine, true, true)
	out.insert_text_at_cursor(line+"\n")

func _input(event):
	if event.is_action('ui_up') and not event.is_pressed():
		commandPointer = min(commandPointer + 1, previousCommands.size() - 1)
		if previousCommands[commandPointer] != "":
			setCommandLine(previousCommands[commandPointer])
		$command.caret_position = $command.text.length()
	if event.is_action('ui_down') and not event.is_pressed():
		commandPointer = max(commandPointer - 1, 0)
		setCommandLine(previousCommands[commandPointer])
		$command.caret_position = $command.text.length()
