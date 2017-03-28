
extends RayCast2D

var this

func _ready():
	this = get_node(".")
	this.set_meta("Type" , "Attack")
	set_process(true)

func _process(delta):
	
	if this.is_colliding():
		print ("colliding")
		print (this.get_collider())
		this.get_collider().get_parent().free()