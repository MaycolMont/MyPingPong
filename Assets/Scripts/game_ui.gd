extends Control

signal max_point_reached(winner_name: String)

@onready var player_score = $Panel/HBoxContainer2/PlayerScorePanel/PlayerScore
@onready var enemy_score = $Panel/HBoxContainer2/EnemyScorePanel/EnemyScore
@onready var alert_label = $AlertLabel
var max_points: int

func _on_ready():
	player_score.label = 'Player'
	enemy_score.label = 'Computer'
	alert_label.visible = false

func add_point(object_name: String):
	var label_score = player_score if object_name == player_score.label else enemy_score
	process_points(label_score, object_name)

func process_points(label_score: LabelScore, text_label: String):
	label_score.add_point()
	if label_score.score == max_points:
		max_point_reached.emit(label_score.label)

func show_alert(msg: String):
	alert_label.text = msg
	alert_label.visible = true

func hide_alert():
	alert_label.text = ''
	alert_label.visible = false

func restart():
	hide_alert()
	player_score.restart()
	enemy_score.restart()
