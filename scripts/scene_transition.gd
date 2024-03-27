extends CanvasLayer

func change_scene(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	yield($AnimationPlayer, 'animation_finished')
# warning-ignore:return_value_discarded
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("dissolve")
