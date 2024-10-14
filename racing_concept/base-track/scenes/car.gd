extends VehicleBody3D

var max_rpm = 500
var max_torque = 200

func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right","left") *0.4, 5 * delta)
	engine_force = Input.get_axis("back", "forward") 
	var acceleration = Input.get_axis("back","forward")
	var rpm = $rear_left.get_rpm()
	$rear_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
	rpm = $rear_right.get_rpm()
	$rear_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
