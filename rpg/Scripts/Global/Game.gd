extends Node

var player_health: int = 10
var player_health_max :int = 2
var right_hand_equipped : ItemData

func heal_player(amount):
	player_health += amount
	if player_health > player_health_max:
		player_health = player_health_max
