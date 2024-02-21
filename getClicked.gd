extends Area2D

@export var new_location = "location2"
@export var curr_location = "location1"

var mouse_was_pressed = false
var mouse_in_area = false






# Called when the node enters the scene tree for the first time.
func _ready():
	#these signals enable and dissable the sprite and the process of the location
	Signals.dissable_location.connect(dissable_location_fn)
	Signals.enable_location.connect(enable_location_fn)
	get_node("%GlowSprite").hide() #hides it initially
	

	

func dissable_location_fn(curr):
	#turns click on or of if is in this location
	if curr_location == curr:
		set_process(false)

	
func enable_location_fn(new):
	#turns click on or of if is in this location
	if curr_location == new:
		set_process(true)
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if mosue was just unpressed and is in proper area, change occurs
	#and if the current char can move
	if mouse_in_area and mouse_was_pressed \
	and not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) \
	and entity_info.charCanMove[entity_info.currentChar]:
		mouse_was_pressed = false #putting here cause was getting some double click,
								#ie i click door, then it is like i clicked again when I didn't
								#I think it is issue with mouse, not the code
		
		#making sure that no bot is in the location being moved to
		var shared_locations_check = []
		for i in range(len(entity_info.shared_locations)): #getting if new_location
						#has any shared locations
			if new_location in entity_info.shared_locations[i]:
				shared_locations_check = entity_info.shared_locations[i]
		if not(entity_info.charLocations["Chica"] in shared_locations_check)\
		  and not(entity_info.charLocations["Bonnie"] in shared_locations_check):
			#if bot locations not in the shared locations, it does the move
			Signals.move_animatronic.emit(curr_location, new_location)
		

	
	#getting when mouse is pressed, so I can get frame mouse button is unpressed
	#I am doing action at unpress, so that it doesn't detect press at location change
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouse_was_pressed = true
		
	else:
		mouse_was_pressed = false
	
func _mouse_enter():
	get_node("%GlowSprite").show()
	mouse_in_area = true
	
func _mouse_exit():
	get_node("%GlowSprite").hide()
	mouse_in_area = false
	
	
