extends Node

onready var loadedPrograms = {
	'baseProgram': load("res://ProgramNode.tscn")
}

onready var loadedParts = {
	'onePart': load("res://RigPart.tscn")
}

class Inventory:
	var main = null
	var items = {
	}
	var creds = 0
	var programs = []
	var rigParts = []
	
	func _init(gameNode):
		main = gameNode
		programs = [
			main.loadedPrograms['baseProgram'].instance(),
			main.loadedPrograms['baseProgram'].instance(),
			main.loadedPrograms['baseProgram'].instance(),
			main.loadedPrograms['baseProgram'].instance(),
			main.loadedPrograms['baseProgram'].instance(),
			main.loadedPrograms['baseProgram'].instance(),
			main.loadedPrograms['baseProgram'].instance(),
		]
		rigParts = [
			main.loadedParts['onePart'],
			main.loadedParts['onePart'],
			main.loadedParts['onePart'],
			main.loadedParts['onePart'],
			main.loadedParts['onePart'],
			main.loadedParts['onePart'],
			main.loadedParts['onePart'],
		]
	
	func addCreds(num):
		creds += num
		return creds
	
	func loseCreds(num):
		creds = min(creds-num, 0)
		return creds
	
	func hasCreds(num):
		return num <= creds
	
	func useItem(item):
		if hasItem(item):
			items[item] = items[item] - 1

	func hasItem(item, quantity = 1):
		if items[item] >= quantity:
			return true
		return false
	
	func addItem(item, quantity):
		items[item] += quantity
	
	func getItemQuantity(item):
		return items[item]

class Rig:
	var threads = 1 #num programs running at once
	var processor = 1 #program speed
	var memory = 3 #num programs ready to run (action bar size)
	var integrity = 1 #health, wear/tear, unusable even as scrap when done
	var trace = 0 #health, tracked down, must scrapped or disassembled when maxed
	
	var coreSlots = 1
	var moduleSlots = 2
	var memorySlots = 1
	
	var programs = [
		#nodes?
	]
	var loadedPrograms = [
		#nodes?
	]
	var activeThreads = [
		#nodes
	]

class Character:
	var main = null
	var characterClass = null
	var script = 0
	var crack = 0
	var analyze = 0
	var experience = 0
	var heat = 0 #adds game dificulty
	
	var rigs = [] #rigs
	var activeRig = Rig.new()
	
	var inventory = null
	
	func _init(gameNode):
		main = gameNode
		inventory = Inventory.new(main)
	
	func setClass(characterClass):
		pass
	
	func addExperience(amount):
		pass
	
	func getInventory():
		return inventory
	
	func getRigs():
		return rigs
	
	func getActiveRig():
		return activeRig

class Store:
	var products
	
	func buy():
		pass

var stores = [
	{
		'id': '',
		'open': false,
		'store': Store.new(),
	},
]

onready var character = Character.new(self)
onready var activeRig = Rig.new()
onready var inventory = Inventory.new(self)

func openStore(storeName):
	for store in stores:
		if store.id == storeName:
			store['open'] = true