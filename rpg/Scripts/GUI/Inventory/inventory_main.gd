extends Control

var items_to_load = [
	"res://Scenes/GUI/Inventory/item Resources/long_sword.tres",
	"res://Scenes/GUI/Inventory/item Resources/small potion.tres"
]

@onready var grid = get_node("grid")
func _ready() -> void:
	for i in range(24):
		var slot = InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(32,32))
		grid.add_child(slot)
	
	for i in items_to_load.size():
		var item = InventoryItem.new()
		item.init(load(items_to_load[i]))
		grid.get_child(i).add_child(item)
