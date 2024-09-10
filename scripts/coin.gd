extends Area2D

func _ready() -> void:
	print("Start")
	
func _on_body_entered(body: Node2D) -> void:
	print("coin")


func _on_body_exited(_body: Node2D) -> void:
	print("coin")
