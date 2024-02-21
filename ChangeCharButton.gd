extends Button

@export var changeToChar = "Chica"







# Called when the node enters the scene tree for the first time.
func _ready():
	self.pressed.connect(change_char)
	text = changeToChar
	
	
func change_char():
	Signals.change_char.emit(changeToChar)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
