extends CharacterBody2D

signal velocity_increased

@onready var state_machine = $StateMachine
@onready var appear_state = $StateMachine/AppearState

@export var throw_to_left := false

# ===================== BUILT-IN METHODS ========================

func _process(delta):
	var current_state = state_machine.current_state
	var collision = move_and_collide(velocity * delta * current_state.current_velocity)
	if collision:
		$BounceAudio.play()
		current_state.handle_collision(collision.get_collider())
	rotation = atan2(velocity.y, velocity.x)

# ===================== PUBLIC METHODS ========================

func throw(_position: Vector2) -> void:
	position = _position
	state_machine.current_state.next_state = appear_state
