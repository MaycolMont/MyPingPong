extends Label

class_name LabelScore

var score: int = 0
var label: String

func _on_ready():
	text = label

func add_point():
	score += 1
	text = label + str(score)
