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
	'This is the intro slide.',
	'This one has options off so it will just be text',
	'each text item will show an arrow in the bottom right to indicate you can proceed.',
	'if its a star instead, you will continue to the next frame',
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
