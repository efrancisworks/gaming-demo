extends Node

var AIController

func _ready():
	AIController = get_parent().get_parent()
	if AIController.Awakening:
		await AIController.get_node("AnimationTree").animation_finished
	AIController.Attacking = true
	AIController.get_node("AnimationTree").get("parameters/playback").travel("Attack")
	AIController.look_at(AIController.global_transform.origin + AIController.direction, Vector3(0, 1, 0))
	
func _process(delta):
	if AIController:
		AIController.velocity.x = 0
		AIController.velocity.z = 0