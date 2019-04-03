extends Node

onready var gameNode = get_tree().get_node('GameNode')

var sceneList = [
	{
		'name': 'Intro',
		'scene': preload("res://NarrativeScenes/DemoScene.tscn"),
	},
]

var sceneFlags = {}

func evaluateState(newFlags):
	for key in newFlags.keys():
		call(key, newFlags[key])

### FLAG RESOLVER HACKS
#dont do stores this way, maybe dont even do scenes this way
func experience(points):
	gameNode.character.gainExperience(points)

var loot = { ## probably dont use this
	#scripts
	'freeze': Node.new(), #increase the players inventory of these by 1
	'encrypt': Node.new(),
	'hash': Node.new(),
	'exploit': Node.new(),
	'trace': Node.new(),
	'scan': Node.new(),
	'crash': Node.new(),
	'crack': Node.new(),
	#info
	'dataCache[character1]': "", #increase the effectiveness of scripts against the target
	'dataCache[character2]': "", #possibly open new scene objects?
	'dataCache[character3]': "", #store items?
	'dataCache[character4]': "",
	'dataCache[character5]': "",
	'dataCache[character6]': "",
	'dataCache[character7]': "",
}

func loot(lootArray):
	for loot in lootArray:
		gameNode.character.addLoot(loot)
		#gameNode.character.addLoot(loot[loot])

func creds(amount):
	gameNode.character.addCreds(amount)


#func special(specialName): 
	

###FLAG RESOLVERS SCENES (also use for load game)
#class
var character = {
	'hacker': Node.new(), #Node.new() = uncreated stat nodes
	'investigator': Node.new(),
	'securityExpert': Node.new()
}

func characterChoice(choice):
	gameNode.character.setClass(character[choice])

#character stats
func script(score):
	gameNode.character.script = score

func crack(score):
	gameNode.character.crack = score

func analyze(score):
	gameNode.character.analyze = score

#character rig
var rigs = {
	'camronDelta': Node.new(),
	'eriksonSkimmer': Node.new(),
	'integronDorado': Node.new(),
}
func characterRig(rig):
	gameNode.character.setRig(rigs[rig])

#first hack tutorial use loot section

#first store (and others)
var stores = {
	'masquerade': Node.new(),
	'riggerJoe': Node.new(),
	'CbdOrWhatever': Node.new(),
	'something else': Node.new(),
}

func store(store):
	gameNode.openStore(store)

## first hack approch
#should determine next scene, hack starting position, chance for heat and data to help with hack
#investigate: object scene, chance for heat and data to help with hack
#infiltrate: VN scene, chance for data, better initial hack user level, chance for heat
#hack: go right to hack, no chance to improve start or gain extra heat
func hack1Approach(approach):
	#unsure how to handle this
	pass
	
	
	
	
	
	
	
	
	
	