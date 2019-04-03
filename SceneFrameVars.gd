extends Node

# USE THIS INSTEAD OF EXPORT VARS IF YOU WANT
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
	'yes': null,
	'no': null,
	'...': null,
}
export(String) var prompt = "Prompt goes here"
export(String) var optionId = "choiceEdgy"
export(Array, Dictionary) var options = [
	{
		'text': 'I accept',
		'flag': 'accept',
	},
]