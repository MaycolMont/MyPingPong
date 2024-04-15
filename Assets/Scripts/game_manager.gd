extends Node2D

@onready var ball := $Ball
@onready var player_score = $Game_UI.player_score
@onready var enemy_score: LabelScore = $Game_UI.enemy_score
@onready var player_goal = $Field.player_goal
@onready var enemy_goal = $Field.enemy_goal
@export var objetive_points: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	ball.throw('left')
	player_score.label = 'Player: '
	enemy_score.label = 'Computer: '

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func restart_ball():
	ball.position = Vector2(640, 360)
	ball.throw('left')

func _on_field_goal(area):
	if area.name == 'PlayerGoal':
		enemy_score.add_point()
	else:
		player_score.add_point()
		
	restart_ball()
