extends Node2D

signal paused

var is_paused := false

@onready var ball := $Ball
@onready var UI = $Game_UI
@export var max_points: int = 10

func _ready():
	_on_start_game()

func _process(_delta):
	handle_inputs()

func restart_ball():
	ball.position = Vector2(640, 360)
	ball.throw('left')

func handle_inputs():
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("Pause"):
		paused.emit()

func _on_start_game():
	UI.max_points = max_points
	ball.throw('left')

func _on_over_game(winner_name: String) -> void:
	ball.queue_free()
	UI.show_alert(winner_name + ' Won')
	set_game_process(false)

func set_game_process(value: bool):
	for child in get_children():
		child.set_process(value)

# añadir manejo de juego tem
func _on_field_goal(area: Area2D):
	if area.name == 'PlayerGoal':
		UI.add_point('Player')
	else:
		UI.add_point('Enemy')

	restart_ball()

func _on_pause():
	is_paused = not is_paused
	if is_paused:
		UI.show_alert('Pausa')
	else:
		UI.hide_alert()

	set_game_process(not is_paused)
