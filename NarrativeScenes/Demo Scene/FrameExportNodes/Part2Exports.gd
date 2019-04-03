extends Node

# USE THIS INSTEAD OF EXPORT VARS IF YOU WANT
export(NodePath) var defaultNext = ""
## image exports
export(Texture) var imageLeft = load("res://Assets/arrow-37-24.png") #texture
export(Texture) var imageRight = load("res://Assets/arrow-37-24.png") #texture
export(bool) var slideInLeft = false
export(bool) var slideInRight = false

## text exports
export(bool) var hasText = false
export(String) var frameName = ''
export(Array, String) var textArray = [
	'The reason I made this slide was to ask a question...',
	'the answer will determine which slide you go to.',
	'if you accept, you will go to optional slide 1,',
	'if you refuse, you will go to optional slide 2,',
	'if you cannot decide, you will go right to the end slide',
]  #string array

## option exports 
export(bool) var hasOption = false
export(Dictionary) var optionsNext = {    #next frame by option choice
	#[flag]: nextFramePath,
	'accept': null,
}
export(String) var prompt = "What is your choice?"   #option prompt string
export(String) var optionId = "choicePath"       #choice id for global state
export(Array, Dictionary) var options = [        #option text and global state value 
	{
		'text': 'I accept',
		'flag': 'accept',
	},
	{
		'text': 'I refuse',
		'flag': 'refuse',
	},
	{
		'text': 'let me think about it',
		'flag': 'unsure',
	}
]
