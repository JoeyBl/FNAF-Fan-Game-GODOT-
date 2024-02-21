extends Label

@export var char = "Bonnie"
@export var cooldownTime = 3 #seconds



# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.move_animatronic.connect(start_timer)
	Signals.change_char.connect(change_character)
	get_child(0).timeout.connect(timer_done)
	
	#sets timer wait time to proper wait time
	get_child(0).wait_time = float(cooldownTime)
	
	#just sets to visible or not if is curr bot or not
	change_character(entity_info.currentChar)
	
	#setting process initially to false, and text to initial
	set_process(false)
	text = char + " cooldown: 0"
	
	
	

func start_timer(uneededParam1, uneededParam2):
	#if moving bot is that which this label is associated with,
	#then timer for that bot starts and that bot can't move
	if entity_info.currentChar == char:
		set_process(true)
		get_child(0).start()
		entity_info.charCanMove[char] = false
	
	
func timer_done():
	#when timer done, that bot can move again.
	set_process(false)
	entity_info.charCanMove[char] = true
	
func change_character(new_char): 
	#if change to this label char, show label. else, hide label.
	if new_char == char:
		set_visible(true)
	else:
		set_visible(false)
		
		
	
#need to relay to entity_info when the char can move.
#so in getClicked when movement occurs, it sets off this timer, and sets
#that char can_move in entity info to false till this timer is done then.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if the timer is running, then is updating the time left
	#I do that weird thing with time left to have it be rounded to first 
	#decimal place
	text = char + " cooldown: " + str(float(int(get_child(0).time_left*10))/10)
	
