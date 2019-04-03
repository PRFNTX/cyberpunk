extends Node

# USE THIS INSTEAD OF EXPORT VARS IF YOU WANT
## image exports
export(Texture) var imageLeft = #texture
export(Texture) var imageRight = #texture
export(bool) var slideInLeft = false
export(bool) var slideInRight = false

## text exports
export(bool) var hasText = false
export(String) var frameName = ''
export(Array, String) var textArray = ['']  #string array

## option exports 
export(bool) var hasOption = false
export(Dictionary) var optionsNext = {    #next frame by option choice
	'yes': null,
	'no': null,
	'...': null,
}
export(String) var prompt = "Prompt goes here"   #option prompt string
export(String) var optionId = "choiceEdgy"       #choice id for global state
export(Array, Dictionary) var options = [        #option text and global state value 
	{
		'text': 'I accept',
		'flag': 'accept',
	},
]
