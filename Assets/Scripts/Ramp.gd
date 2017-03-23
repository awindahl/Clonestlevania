
extends StaticBody2D

var player
var top_ray
var bot_ray
var check_ray
var this

func _ready():
	set_process(true)
	this = get_node(".")
	this.set_meta ("Type" , "Ground")
	player = get_node("../Player")
	top_ray = get_node("0")
	bot_ray = get_node("1")
	check_ray = get_node("2")
	top_ray.add_exception(self)
	bot_ray.add_exception(self)
	
func _process(delta):
	
	if top_ray.is_colliding():
		set_layer_mask(1)
		set_collision_mask(1)
	
	if bot_ray.is_colliding() && !Input.is_action_pressed("ui_up"):
		set_layer_mask(2)
		set_collision_mask(2)
	
	if check_ray.is_colliding():
		set_layer_mask(2)
		set_collision_mask(2)
	
	if bot_ray.is_colliding() && Input.is_action_pressed("ui_up"):
		set_layer_mask(1)
		set_collision_mask(1)
	