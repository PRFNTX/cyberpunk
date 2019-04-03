extends Node2D

const root = 3
const admin = 2
const user = 1
const guest = 0

export(int, 'guest', 'user', 'admin', 'root') var priveledge = 0
export(int, 'directory', 'process', 'database', 'system file') var fileType = 0
export(Array, NodePath) var connections = []
export(int, "none", "basic", "moderate", "advanced", "military") var encryption = 0

func addConnection(node):
	connections.append(node)