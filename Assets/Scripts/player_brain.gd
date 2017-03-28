extends RigidBody2D

var angle_tolerance = 45
var attack_val = 0
var attack_wait = 0
var ramp_val
var scale_val
var foot1
var foot2
var foot3
var attack
var whip
var foot_val = 0
var sprite
var head1
var head2
var body_r
var body_r_check = 0
var body_l
var body_l_check = 0
var jump_height = -400
var move_speed = 150
var veloc_const = 0
var cur_veloc = Vector2(0,0)
var no_veloc = Vector2(0,0)
var other
var globals

func _ready():
	
	connect("body_enter", self, "_on_body_enter")
	
	set_process(true)
	attack = get_node("attack")
	foot1 = get_node("foot1")
	foot2 = get_node("foot2")
	foot3 = get_node("foot3")
	whip = get_node ("attack/whip")
	head1 = get_node("head1")
	head2 = get_node("head2")
	body_r = get_node("body_r")
	body_l = get_node("body_l")
	sprite = get_node("Sprite")
	foot1.add_exception(self) #player
	foot2.add_exception(self)
	foot3.add_exception(self)
	body_r.add_exception(self)
	body_l.add_exception(self)
	head1.add_exception(self)
	head2.add_exception(self)
	attack.add_exception(self)

	set_mode(2)
	
func _on_body_enter (other):
	if other.get_meta("Type") == "Enemy" && Global.invTimer == 0:
		Global.health -= 1
		Global.invTimer = 85
		set_axis_velocity(Vector2(-move_speed,jump_height))
	
	if other.get_meta("Type") == "Coin":
		Global.coinFlag = true
		other.free()
	
func _process(delta):
	
	sprite.set_blend_mode(0)
	if Global.invTimer > 0:
		sprite.set_blend_mode(1)
		Global.invTimer -= 1
		print (Global.invTimer)
	cur_veloc = get_linear_velocity()
	foot_val = 0
	ramp_val = 0
	body_r_check = 0
	body_l_check = 0
	veloc_const = 0
	
	if Global.health == 0:
		Global.coinCount = 0
		Global.health = 3
		get_tree().reload_current_scene()
	
	if cur_veloc.y == no_veloc.y:
		veloc_const = 1
	
	if foot1.is_colliding() || foot2.is_colliding() || foot3.is_colliding():
		foot_val = 1
	
	if body_r.is_colliding():
		body_r_check = 1
	
	if body_l.is_colliding():
		body_l_check = 1
	
	if foot_val && (cur_veloc.y == no_veloc.y):
		if Input.is_action_pressed("ui_select"):
			set_axis_velocity(Vector2(0,jump_height))
			
	if body_l_check && !foot_val && veloc_const && (Input.is_action_pressed("ui_right")):
		if Input.is_action_pressed("ui_select"):
			set_axis_velocity(Vector2(move_speed,jump_height))
			
	if body_r_check && !foot_val && veloc_const && (Input.is_action_pressed("ui_left")):
		if Input.is_action_pressed("ui_select"):
			set_axis_velocity(Vector2(-move_speed,jump_height))
		
	if foot_val && !body_r.is_colliding() && !ramp_val && attack_val == 0:
		if Input.is_action_pressed("ui_right"): 
			set_axis_velocity(Vector2(move_speed,0))
			
	
	if foot_val && !body_l.is_colliding() && !ramp_val && attack_val == 0:
		if Input.is_action_pressed("ui_left"):
			set_axis_velocity(Vector2(-move_speed,0))
	
	if scale_val == 2:
		sprite.set_flip_h(true)
		attack.set_rot(-1.57079632679)
	if scale_val == 1:
		sprite.set_flip_h(false)
		attack.set_rot(1.57079632679)
	
	if cur_veloc.y == 0 && Input.is_action_pressed("ui_right") && attack_val == 0:
		scale_val = 1
	if cur_veloc.y == 0 && Input.is_action_pressed("ui_left") && attack_val == 0:
		scale_val = 2
	
	if attack_val < 101 && attack_val > 0:
		attack_val-=1
	
	if attack_val == 0 && attack_wait > 0:
		whip.set_hidden(true)
		attack.set_enabled(false)
		attack_wait -= 1
	
	if Input.is_action_pressed("ui_action") && attack_val == 0 && attack_wait == 0:
		attack_wait = 20
		attack.set_enabled(true)
		attack_val = 35
		#print ("attacking")
		whip.set_hidden(false)
		
	if attack.is_colliding():
		1+1
		#print("hitting")
	
	if Input.is_key_pressed(81):
		get_tree().quit()
	if Input.is_key_pressed(82):
		get_tree().reload_current_scene()
	