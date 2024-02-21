extends Node


var charLocations = {"Chica": "locationChica1", "Bonnie":"locationBonnie1"}

var charCanMove = {"Chica": true, "Bonnie":true}

var currentChar = "Bonnie"

#these are locations where two bots can be in them at same time.
var shared_locations = [["locationBonnie3", "locationBonnie5",\
	"locationChica3","locationChica5"],["locationChica4","locationBonnie4"]]




# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
