extends Control

func _ready() -> void:
	for i in range(24):
		var slot = InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(32,32))
		get_node("grid").add_child(slot)
