extends CharacterBody2D

@export var SPEED = 300.0
@export var to_flip = false

func _ready():
	if to_flip:
		$Sprite2D.flip_h = true
	
func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	handle_input()

	move_and_collide(velocity * delta)

func handle_input():
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
