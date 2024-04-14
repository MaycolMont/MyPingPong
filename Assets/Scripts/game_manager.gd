extends Node2D

var ball: CharacterBody2D
var player_score: LabelScore
var enemy_score: LabelScore
@export var objetive_points: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	ball = $Ball
	ball.throw('left')
	player_score = $Game_UI.player_score
	player_score.label = 'Player: '
	enemy_score = $Game_UI.enemy_score
	enemy_score.label = 'Computer: '

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func restart_ball():
	ball.position = Vector2(640, 360)
	ball.throw('left')
	
func _on_goal_enemy_body_entered(_body):
	enemy_score.add_point()
	restart_ball()
	
func _on_goal_player_body_entered(_body):
	player_score.add_point()
	restart_ball()
