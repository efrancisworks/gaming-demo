extends Node2D
const SPEED = 10

var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	$AnimatedSprite2D.flip_h = true
