extends Control

func _ready() -> void:
	var slot = InventorySlot.new()
	add_child(slot)


func _on_control_gui_input(event: InputEvent) -> void:
	print("Event")
