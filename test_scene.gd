extends Node

@export var ball_scene : PackedScene
@export var player_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var ball = ball_scene.instantiate()
	add_child(ball)
	ball.position = Vector2(150, 150)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
