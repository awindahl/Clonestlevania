
extends RichTextLabel

var temp

func _ready():
	
	add_text("Coins: ")
	temp = str (Global.coinCount)
	add_text(temp)
	set_process(true)
	
	
func _process(delta):
	
	
	if Global.coinFlag == true:
		clear()
		if Global.coinCount < 99 :
			Global.coinCount+=1
		add_text ("Coins: ")
		temp = str (Global.coinCount)
		add_text (temp)
		Global.coinFlag = false