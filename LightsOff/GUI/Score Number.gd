extends Label

var score = 0

func _ready():
	reset()


func _on_TileGrid_click():
	score += 1
	self.text = str(score)


func _on_Reset_Button_reset():
	reset()


func reset():
	score = 0
	self.text = str(score)
