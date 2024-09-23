extends CharacterBody3D


var speed: float = 1.0
@onready var state_controller = get_node("StateMachine")
@export var player: CharacterBody3D
var direction: Vector3
var Awakening: bool = false
var Attacking: bool = false
var health: int = 4
var damage: int =2 
var dying: bool = false
var just_hit: bool = false

func _ready() -> void:
	state_controller.change_state("Idle")
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if player:
		direction = (player.global_transform.origin - self.global_transform.origin).normalized()
		
	
	move_and_slide()


func _on_chase_player_detection_body_entered(body: Node3D) -> void:
	pass # Replace with function body.


func _on_attack_player_detection_body_entered(body: Node3D) -> void:
	pass # Replace with function body.


func _on_chase_player_detection_body_exited(body: Node3D) -> void:
	pass # Replace with function body.


func _on_attack_player_detection_body_exited(body: Node3D) -> void:
	pass # Replace with function body.
