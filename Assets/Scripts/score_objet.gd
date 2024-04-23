class_name LabelScore
extends Label

var score: int = 0
var label: String

func _ready():
	label = text

func _process(_delta):
	text = label + ': ' + str(score)
