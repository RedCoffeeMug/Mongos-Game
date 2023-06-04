extends Control

onready var popup = get_node("OptionsMenu")


func _ready():
	visible = false



func _input(event):
	if Input.is_action_pressed("Game_Paused"):
		visible = not visible



func _on_ContinueButton_pressed():
	visible = false



func _on_OptionsButton_pressed():
	popup.visible = true


func _on_MenuButton_pressed():
	visible = false
	SceneTransition.change_scene("res://Scenes/Menu.tscn")

