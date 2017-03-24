
extends RigidBody2D

var this

func _ready():
	this = get_node(".")
	this.set_meta("Type" , "Attack")
	set_mode(1)

func _on_body_enter(other):
	if other.get_meta("Type") == "Enemy":
		other.free()