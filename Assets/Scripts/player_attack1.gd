
extends RayCast2D

var this

func _ready():
	this = get_node(".")
	this.set_meta("Type" , "Attack")
