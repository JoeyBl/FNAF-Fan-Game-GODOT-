extends Sprite2D

@export var location = "location#"



#add a inspector changeable list. this list contains pairs of childNodeSpriteName
#and associated location (ie say you are seeing bonnie, and bonnie is at 
#locationBonnie2, and chica is, same room, locationChica3. then one pair will be
#something like "%Chica1" and "locationChica3". basically, if something is
#in locationChica3 (which will only be chica) then it will make the child sprite
#Chica1 visible. so just need a bunch of pre-existing childnode subsprites,
#such as sprite2D Chica1, Chica2, Chica3, Chica4, Bonnie1, Bonnie2, "res://images/icon.svg"Bonnie3,
#Puppet1, Puppet2, Puppet3. etc.
@export var ChicaLoc_ChicaSprite = "0;0 0;0" #first # is ChicaLocation#, second # is sprite2D child
					#node Chica sprite. will be split by " ", thne by ";"
#ie (location of bot);(sprite2D child node)
@export var BonnieLoc_BonnieSprite = "0;0 0;0" #simialr format as above





#when I do the closet stuff, location will need variable isCloset, or maybe not
#and it is all stored in the entity_info autoload.


# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.dissable_location.connect(dissable_location_fn)
	Signals.enable_location.connect(enable_location_fn)
	dissable_char_sprites()
	
	
func dissable_location_fn(curr):
	#makes location sprite not visible
	if location == curr:
		set_visible(false) 

	
func enable_location_fn(new):
	#makes location sprite visible
	if location == new:
		set_visible(true)

		
func dissable_char_sprites():
	for i in range(1,6):
		get_node("%Chica"+str(i)).hide()
		get_node("%Bonnie"+str(i)).hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	#setting the images of the animatronics at dif locations to invisible
	#then below I show the one where it is. this might be excessive, but it
	#makes sure this is up to date.
	dissable_char_sprites()
	
		
	#for bonnie and chica, this sets to show the sprite containing the bot in
	#the given location that the bot should be at
	#note, chica loc and bonnie loc is just last part of loc (ie the exact loc
	#name, no room. room is just there for help with other ais i think)
	for pair in ChicaLoc_ChicaSprite.split(" "):
		var chica_loc = pair.split(";")[0] #gets loc name
		var chica_sprite = "%Chica" + pair.split(";")[1]
		if entity_info.charLocations["Chica"].split("-")[3] == chica_loc:
			get_node(chica_sprite).show()
	for pair in BonnieLoc_BonnieSprite.split(" "):
		var bonnie_loc = pair.split(";")[0]
		var bonnie_sprite = "%Bonnie" + pair.split(";")[1]
		if entity_info.charLocations["Bonnie"].split("-")[3] == bonnie_loc:
			get_node(bonnie_sprite).show()
			
		
		
