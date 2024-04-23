extends Node2D


signal goal(area: Area2D)


@onready var player_goal = $PlayerGoal
@onready var enemy_goal = $EnemyGoal


func _on_goal(area):
	goal.emit(area)
