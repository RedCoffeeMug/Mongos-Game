extends Control




func _ready():
	visible = false



func _input(event):
	if Input.is_action_pressed("Game_Paused"):
		visible = not visible



func _on_ContinueButton_pressed():
	visible = false



func _on_OptionsButton_pressed():
	pass # Replace with function body.




func _on_QuitButton_pressed():
	visible = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
