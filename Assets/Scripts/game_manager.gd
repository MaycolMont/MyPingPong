extends Node2D


# ===================== VARIABLES ========================

@export var max_points: int = 10

var is_paused := false:
	set = _set_is_pause
	
@export var ball_scene : PackedScene
@export var player_scene : PackedScene

@onready var ball := $Ball
@onready var UI = $Game_UI



# ===================== BUILT-IN METHODS ========================

func _ready():
	_start_game()

func _process(_delta):
	_handle_inputs()



# ===================== PRIVATE METHODS ========================

func _handle_inputs() -> void:
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()# salir de la ventana
	elif Input.is_action_just_pressed("Pause"):
		is_paused = not is_paused ## activa la función set_is_pause
	elif Input.is_action_just_pressed("Restart"):
		_restart_game()

func _set_is_pause(value: bool) -> void:
	is_paused = value
	if is_paused:
		UI.show_alert('Pausa')
	else:
		UI.hide_alert()

	set_game_process(not is_paused)

func _start_game() -> void:
	UI.max_points = max_points
	ball.throw(Vector2(640, 360))

func set_game_process(value: bool) -> void:
	for child in get_children():
		child.set_process(value)

func _restart_game():
	ball.throw(Vector2(640, 360))
	UI.restart()

# ===================== SIGNAL CALLBACKS ========================

func _on_over_game(winner_name: String):
	ball.visible = false
	UI.show_alert(winner_name + ' Won')
	set_game_process(false)

func _on_field_goal(area: Area2D):
	if area.name == 'PlayerGoal':
		UI.add_point('Enemy')
	else:
		UI.add_point('Player')

	ball.throw(Vector2(640, 360))

func _on_ball_velocity_increased():
	UI.show_temp_label('x1.05', 2)
