extends Area3D

var rng: int 
func _ready() -> void:
	rng = randi_range(0,2)
	get_node("sword").hide()
	get_node("potion").hide()
	get_node("body").hide()
	
	
	match rng:
		0: # long sword
			get_node("sword").show()
		1: # potion
			get_node("potion").show()
		2: # body armor 
			get_node("body").show()
			

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		match rng:
			0:
				get_node("../../GUI/container/Inventory").add_item("long sword")
			1:
				get_node("../../GUI/container/Inventory").add_item("small potion")
			2:
				get_node("../../GUI/container/Inventory").add_item("body armor")

		self.queue_free()
