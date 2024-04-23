class_name StateMachine
extends Node

## declarar referencias globales
@export var current_state: BallState

func _process(delta):
	if current_state.next_state != null:
		change_state(current_state.next_state)

func change_state(new_state: BallState):
	current_state.exit()
	current_state.next_state = null
	current_state = new_state
	current_state.enter()
