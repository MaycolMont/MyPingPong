extends Label

class_name LabelScore

var score: int = 0
var label: String

# Called when the node enters the scene tree for the first time.
func _ready():
	text = label + str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func add_point():
	score += 1
	text = label + str(score)
	
