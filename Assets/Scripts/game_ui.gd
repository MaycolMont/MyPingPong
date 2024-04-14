extends Control

var player_score
var enemy_score

# Called when the node enters the scene tree for the first time.
func _ready():
	player_score = $Panel/HBoxContainer2/PlayerScorePanel/PlayerScore
	enemy_score = $Panel/HBoxContainer2/EnemyScorePanel/EnemyScore

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
