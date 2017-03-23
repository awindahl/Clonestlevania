
extends RigidBody2D

var this

func _ready():
	this = get_node(".")
	set_mode(1)
	this.set_meta ("Type" , "Coin")
	