
extends RichTextLabel

var temp

func _ready():
	
	add_text ("Health: ")
	temp = str (Global.health)
	add_text (temp)
	set_process(true)
	
	
func _process(delta):
	
	if Global.hitFlag == true:
		clear()
		add_text("Health: ")
		temp = str (Global.health)
		add_text(temp)
	
	