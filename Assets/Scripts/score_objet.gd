extends Label

class_name LabelScore

@onready var score: int = 0
@onready var label: String

func _on_ready():
	text = label

func add_point():
	score += 1
	text = label + ': ' + str(score)

func restart():
	score = 0
