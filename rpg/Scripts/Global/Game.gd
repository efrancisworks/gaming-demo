extends Node

var items ={
	"default": preload("res://Scenes/GUI/Inventory/item Resources/default_sword.tres"),
	"long sword": preload("res://Scenes/GUI/Inventory/item Resources/long_sword.tres"),
	"small potion": preload("res://Scenes/GUI/Inventory/item Resources/small potion.tres"),
	"body armor": preload("res://Scenes/GUI/Inventory/item Resources/body_armor.tres")
	
	
	 
}

var player_health: int = 10
var player_health_max :int = 2
var right_hand_equipped : ItemData
var body_equipped : ItemData

func heal_player(amount):
	player_health += amount
	if player_health > player_health_max:
		player_health = player_health_max
