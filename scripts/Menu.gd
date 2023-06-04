extends Control

onready var popup = get_node("OptionsMenu")


func _on_StartButton_pressed():
	SceneTransition.change_scene("res://Scenes/House.tscn")


func _on_OptionsButton_pressed():
	popup.visible = true


func _on_QuitButton_pressed():
	get_tree().quit()
