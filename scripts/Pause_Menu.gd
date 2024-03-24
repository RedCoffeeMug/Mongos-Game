extends Control


func _ready():
	visible = false



func _input(_event):
	if Input.is_action_just_released("Game_Paused"):
		visible = not visible



func _on_ContinueButton_pressed():
	visible = false



func _on_MenuButton_pressed():
	visible = false
	SceneTransition.change_scene("res://Scenes/Menu.tscn")



func _on_SaveButton_pressed():
	var data = {
		"Pats" : global.pats ,
		"Coins" : global.coins ,
		"Timeofday" : DayTransition.Day ,
		#"Muted" : global.is_muted
	}
	
	
	var file = File.new()
	var error = file.open(global.save_path, File.WRITE)
	if error == OK:
		file.store_var(data)
		file.close()

