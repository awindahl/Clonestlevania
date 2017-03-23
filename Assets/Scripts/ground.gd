
extends StaticBody2D
var this

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	this = get_node(".")
	this.set_meta ("Type" , "Ground")
	pass


