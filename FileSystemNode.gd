extends Node

### devault values for all FileSystemNodes
export(int) var firewall = 0 #difficulty to access
export(int) var authority = 0 #authority level required to access
export(int) var overwatch = 0 #how likely intrustions are to be detected
export(String) var name = ""