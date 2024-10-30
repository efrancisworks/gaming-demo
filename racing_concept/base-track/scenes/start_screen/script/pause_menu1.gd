extends Control

var selected_option = 0
var options = ["Resume", "Exit"]


func _on_resume_pressed() -> void:
	hide()  # Hide the pause menu when resume is pressed

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start_screen/start-screen.tscn")

func _input(event):
	if event.is_action_pressed("ui_cancel"):  # "ui_cancel" is typically mapped to the Esc key
		if not visible:
			show()  # Show the pause menu when Esc is pressed and the menu is not visible
			get_tree().paused = true  # Pause the game when the menu is shown
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Make the mouse visible when paused
		else:
			hide()  # Hide the pause menu when Esc is pressed and the menu is visible
			get_tree().paused = false  # Unpause the game when the menu is hidden
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Hide the mouse when unpaused
	
	elif event.is_action_pressed("ui_right_ctrl"):  # "ui_right_ctrl" is typically mapped to the right Control key
		get_tree().quit()  # Close the game when right Control is pressed
