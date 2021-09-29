extends Button

signal reset()


func _on_Reset_Button_pressed():
	emit_signal("reset")
