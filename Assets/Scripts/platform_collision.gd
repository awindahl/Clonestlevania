
extends StaticBody2D

var this
var collider_val = 0
var check_val = 0
var collider_amount
var array_c = []
var player

func _ready():
	
	this = get_node(".")
	this.set_meta ("Type" , "Ground")
	set_process(true)
	player = get_node("../Player")
	
	collider_amount = get_child_count() - 2

	for i in range (collider_amount):
		array_c.append(i)

	for i in range (array_c.size()):
		array_c[i] = get_node(str(i))
	
func _process(delta):
	collider_val = 0

	for i in range (array_c.size()):
		if array_c[i].is_colliding():
			collider_val = 1
		
	
	if collider_val:
		set_layer_mask(0)
		set_collision_mask(0)

	if !collider_val:
		set_layer_mask(1)
		set_collision_mask(1)
