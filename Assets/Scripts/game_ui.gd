extends Control

signal max_point_reached(winner_name: String)

@onready var player_score = $Panel/HBoxContainer2/PlayerScorePanel/PlayerScore
@onready var enemy_score = $Panel/HBoxContainer2/EnemyScorePanel/EnemyScore
@onready var alert_label = $AlertLabel
var max_points: int

func _ready():
	alert_label.visible = false

# ===================== PUBLIC METHODS ========================

func add_point(object_name: String) -> void:
	var label_score = player_score if object_name == player_score.label else enemy_score
	_process_points(label_score)

func restart() -> void:
	hide_alert()
	player_score.score = 0
	enemy_score.score = 0

func show_alert(msg: String) -> void:
	alert_label.text = msg
	alert_label.visible = true

func hide_alert() -> void:
	alert_label.text = ''
	alert_label.visible = false

func show_temp_label(msg: String, time: float = 1) -> void:
	$TempLabel.show_label(msg, time)



# ===================== PRIVATE METHODS ========================

func _process_points(label_score: LabelScore):
	label_score.score += 1
	if label_score.score == max_points:
		max_point_reached.emit(label_score.label)
