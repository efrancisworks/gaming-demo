extends CharacterBody3D


const SPEED = 1.0

@onready var state_controller = get_node("StateMachine")
@export var player: CharacterBody3D

var direction: Vector3
var Awakening: bool = false
var Attacking: bool = false
var health: int = 4
var damage: int = 2
var dying: bool = false
var just_hit: bool = false




func _ready() -> void:
	state_controller.change_state("Idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if player:
		direction = (player.global_transform.origin - self.global_transform.origin)
		print(direction)
	move_and_slide()


func _on_just_hit_timeout() -> void:
	just_hit = false


func _on_chase_player_detection_body_entered(body: Node3D) -> void:
	if "player" in body.name and !dying:
		state_controller.change_state("Run")
		
		

func _on_chase_player_detection_body_exited(body: Node3D) -> void:
	if "player" in body.name and !dying:
		state_controller.change_state("Idle")


func _on_attack_player_detection_body_entered(body: Node3D) -> void:
	if "player" in body.name and !dying:
		state_controller.change_state("Attack")


func _on_attack_player_detection_body_exited(body: Node3D) -> void:
	if "player" in body.name and !dying:
		state_controller.change_state("Run")


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if "Awaken" in anim_name:
		Awakening = false
	elif "Attack" in anim_name:
		if player in $attack_player_detection.get_overlapping_bodies():
			state_controller.change_state("Attack")
	elif "Death" in anim_name:
		self.queue_free()
