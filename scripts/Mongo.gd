	extends Sprite

signal pats_changed()
var can_click = true

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			if can_click == true and DayTransition.Day == true and $"../PauseMenu".visible == false:
				can_click = false
				emit_signal("pats_changed")
				$PatsCooldown.start()



func _on_PatsCooldown_timeout():
	can_click = true
