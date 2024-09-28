extends CanvasLayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("paused"):
		get_tree().paused = !get_tree().paused
		get_node("container").visible = get_tree().paused
		
