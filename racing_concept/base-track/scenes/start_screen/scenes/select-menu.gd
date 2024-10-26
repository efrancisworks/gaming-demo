extends Control


var cars =[]
var current_car_index = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cars = [$Node3D/Cop2, $Node3D/SportsCar22, $Node3D/SUV2, $Node3D/Taxi2] 
	update_car_display()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_prev_pressed() -> void:
	current_car_index = (current_car_index - 1 + cars.size()) % cars.size()
	update_car_display()

func _on_next_pressed() -> void:
	current_car_index = (current_car_index + 1) % cars.size()
	update_car_display()

func update_car_display():
	for car in cars:
		car.visible = false
	cars[current_car_index].visible = true


func _on_back_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/start_screen/start-screen.tscn")
