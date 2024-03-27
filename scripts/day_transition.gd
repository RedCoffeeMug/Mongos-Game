extends Node

var Day = true
onready var Daytimer = $DayTimer
signal time_changed


func _ready():
	$CorrectScene.start()
	Daytimer.start()
	Daytimer.paused = true


func _on_CorrectScene_timeout():
	match get_tree().current_scene.name:
		"House":
			Daytimer.paused = false
		"Menu":
			Daytimer.paused = true


func _on_DayTimer_timeout():
	Day = not Day
	if Day == false:
		print("night")
		emit_signal("time_changed")
	else:
		print("Day")
		emit_signal("time_changed")
