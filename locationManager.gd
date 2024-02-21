extends Node





# Called when the node enters the scene tree for the first time.
func _ready():
	#assigning start location. 
	for loc in ["locationBonnie1","locationBonnie2","locationBonnie3",\
	"locationBonnie4","locationBonnie5"]:
		Signals.dissable_location.emit(loc)
	Signals.enable_location.emit("locationBonnie1")
	
	#signal for if change of location occurs
	Signals.move_animatronic.connect(move_animatronic_fn)
	
	#for changing char
	Signals.change_char.connect(change_character)
	
	
func change_character(char):
	#go to animatronic loation location
	#the signal is format (curr loc, new loc)
	
	#dissables current location, being location of current bot played,
	#and enables location of new bot gone to

	Signals.dissable_location.emit(entity_info.charLocations[entity_info.currentChar])
	Signals.enable_location.emit(entity_info.charLocations[char])
	
	
	#updates what the current bot is
	entity_info.currentChar = char
	

func move_animatronic_fn(curr_location, new_location):
	
	#when changes location, it dissables the location that called the change
	#and enables the location being changed to. could just do this dissabling
	#when the location script area is clicked.
	Signals.dissable_location.emit(curr_location)
	Signals.enable_location.emit(new_location)
	
	#this assumes the change location is only over used when moving a bot.
	entity_info.charLocations[entity_info.currentChar] = new_location

	#turn off visibility and location of current scene, and turn on that of new scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
