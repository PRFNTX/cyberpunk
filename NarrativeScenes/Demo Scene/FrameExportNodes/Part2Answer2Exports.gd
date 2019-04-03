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
export(String) var frameName = 'Refusal'
export(Array, String) var textArray = [
	'Wow, this is just a tech demo and you are already being difficult.',
	'fine, i don\'t care, but ill remember what you chose anyway',
	'onward to the end slide!'
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
