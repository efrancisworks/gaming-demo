extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/track/sonoma-track.tscn")
	

func _on_quit_pressed() -> void:
	get_tree().quit()
	


func _on_cars_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/start_screen/scenes/select-car.tscn")
