extends Node2D

@onready var player_goal = $PlayerGoal
@onready var enemy_goal = $EnemyGoal

signal goal(area: Area2D)

func _on_goal(area):
	goal.emit(area)
