extends Node

var Day = true
onready var Daytimer = $DayTimer
signal time_changed


func _ready():
	Day = true
	$CorrectScene.start()


func _on_CorrectScene_timeout():
	if get_tree().current_scene.name == "House" and Daytimer.is_stopped() == true:
		Daytimer.start()
	elif get_tree().current_scene.name == "Menu":
		Daytimer.stop()


func _on_DayTimer_timeout():
	Day = not Day
	if Day == false:
		print("night")
		emit_signal("time_changed")
	else:
		print("Day")
		emit_signal("time_changed")
