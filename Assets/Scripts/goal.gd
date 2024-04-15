extends Area2D

signal goal(area: Area2D)

func _on_body_entered(_body):
	goal.emit(self)
