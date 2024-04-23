extends Label

@onready var show_timer = $ShowAlertTimer

func _on_ready():
	visible = false

func show_label(msg: String, time: float):
	visible = true
	text = msg
	show_timer.start(time)

func _on_show_alert_timer_timeout():
	visible = false
