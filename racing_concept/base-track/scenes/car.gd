extends VehicleBody3D

var max_rpm = 500
var max_torque = 200

@onready var pivot = $camera_origin
@export var sens = 0.5

func _ready():
	Input.mouse_mode =  Input.MOUSE_MODE_CAPTURED
func _input(event):
	#Camera does not limit on y axis
	if event is InputEventMouseMotion:
		#pivot.rotate_y(deg_to_rad(-event.relative.x * sens))
		#pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		#pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))
		# Rotate the pivot around the Y-axis (left-right rotation)
		pivot.rotate_y(deg_to_rad(-event.relative.x * sens))
		# Rotate the pivot around the X-axis (up-down rotation)
		# Store current rotation in a temporary variable
		var new_x_rotation = pivot.rotation.x + deg_to_rad(-event.relative.y * sens)
		# Clamp the X rotation to prevent the camera from flipping
		pivot.rotation.x = clamp(new_x_rotation, deg_to_rad(-45), deg_to_rad(45))		
	
func _physics_process(delta: float) -> void:
	steering = lerp(steering, Input.get_axis("right","left") *0.4, 5 * delta)
	engine_force = Input.get_axis("back", "forward") 
	var acceleration = Input.get_axis("back","forward")
	var rpm = $rear_left.get_rpm()
	$rear_left.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
	rpm = $rear_right.get_rpm()
	$rear_right.engine_force = acceleration * max_torque * (1 - rpm / max_rpm)
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
