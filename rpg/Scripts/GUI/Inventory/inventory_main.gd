extends Control

var items_to_load = [
	"res://Scenes/GUI/Inventory/item Resources/long_sword.tres",
	"res://Scenes/GUI/Inventory/item Resources/small potion.tres"
]

@export var inventory_size = 24
@onready var grid = get_node("grid")
func _ready() -> void:
	for i in range(inventory_size):
		var slot = InventorySlot.new()
		slot.init(ItemData.Type.MAIN, Vector2(32,32))
		grid.add_child(slot)
	
	add_item("small potion")
	add_item("small potion")
	add_item("small potion")
	add_item("small potion")
	add_item("body armor")
	add_item("long sword")
	#for i in items_to_load.size():
		#var item = InventoryItem.new()
		#item.init(load(items_to_load[i]))
		#grid.get_child(i).add_child(item)

func add_item(item_name: String) -> void:
	var item = InventoryItem.new()
	item.init(Game.items[item_name])
	if item.data.stackable:
		for i in inventory_size:
			if grid.get_child(i).get_child_count() > 0:
				if grid.get_child(i).get_child(0).data == item.data:
					grid.get_child(i).get_child(0).data.count +=1
#					update the label counter
					grid.get_child(i).get_child(0).get_child(0).text = str(grid.get_child(i).get_child(0).data.count)
					break
			else:
				grid.get_child(i).add_child(item)
				break
	else:
		for i in inventory_size:
			if grid.get_child(i).get_child_count() ==  0:
				grid.get_child(i).add_child(item)
				break
				
