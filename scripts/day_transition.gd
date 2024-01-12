extends Node

var Day = true
signal time_changed


func _ready():
	Day = true
	$CorrectScene.start()


func _on_CorrectScene_timeout():
	if get_tree().current_scene.name == "House" and $DayTimer.is_stopped() == true:
		$DayTimer.start()
	elif get_tree().current_scene.name == "Menu":
		$DayTimer.stop()


func _on_DayTimer_timeout():
	Day = not Day
	if Day == false:
		print("night")
		emit_signal("time_changed")
	else:
		print("Day")
		emit_signal("time_changed")
