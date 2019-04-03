extends Node

# USE THIS INSTEAD OF EXPORT VARS IF YOU WANT
export(NodePath) var defaultNext = ""
## image exports
export(Texture) var imageLeft = load("res://Assets/arrow-37-24.png") #texture
export(Texture) var imageRight = load("res://Assets/arrow-37-24.png") #texture
export(bool) var slideInLeft = false
export(bool) var slideInRight = false

## text exports
export(bool) var hasText = true
export(String) var frameName = 'Final Slide'
export(Array, String) var textArray = [
	'this is the final slide.',
	'when this is done, it should tell you the result of you choices in the console',
	'the post scene code isn\'t written yet otherwise.',
	'let me know what you think,',
]  #string array

## option exports 
export(bool) var hasOption = false
export(Dictionary) var optionsNext = {    #next frame by option choice
	#[flag]: nextFramePath,
	'accept': null,
}
export(String) var prompt = "Prompt goes here"   #option prompt string
export(String) var optionId = "choiceEdgy"       #choice id for global state
export(Array, Dictionary) var options = [        #option text and global state value 
	{
		'text': 'I accept',
		'flag': 'accept',
	},
]
