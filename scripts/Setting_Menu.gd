extends Control

func _ready():
	hide()
	if global.is_muted == false:
		$VBoxContainer/MuteButton.text = "Mute"
	elif global.is_muted == true:
		$VBoxContainer/MuteButton.text = "Unmute"

func _on_MuteButton_pressed():
	if global.is_muted == false:
		global.is_muted = true
		$VBoxContainer/MuteButton.text = "Umute"
	elif global.is_muted == true:
		global.is_muted = false
		$VBoxContainer/MuteButton.text = "Mute"


func _on_Exit_pressed():
	hide()
