extends Node

var day = true;
signal time_changed()


func _on_Timer_timeout():
	day = not day
	emit_signal("time_changed")
