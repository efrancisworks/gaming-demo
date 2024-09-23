extends Node

var state ={
	"Idle" : preload("res://Scripts/monsters/AI Melee/IdleState.gd"),
	"Run" : preload("res://Scripts/monsters/AI Melee/RunState.gd"),
	"Attack" : preload("res://Scripts/monsters/AI Melee/AttackState.gd"),
	"Death" : preload("res://Scripts/monsters/AI Melee/DeathState.gd")
}

func change_state(new_state: String):
	if get_child_count() != 0:
		if !("Death" in get_child(0).name):
			get_child(0).queue_free()
		if state.has(new_state):
			var stateTemp = state[new_state].new()
			stateTemp.name = new_state
			add_child(stateTemp)
