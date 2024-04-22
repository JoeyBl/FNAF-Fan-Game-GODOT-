extends Node


var charLocations = {"Chica": "loc-Chica-1-2", "Bonnie":"loc-Bonnie-1-2"}

var charCanMove = {"Chica": true, "Bonnie":true}

var currentChar = "Bonnie"

#these are locations where two bots can be in them at same time.
#is just location number
var shared_locations = [["c", "d"], ["a", "b"], ["e", "f"], ["16"]]




# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
