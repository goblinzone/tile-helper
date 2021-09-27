extends Label

var score = 0

func _ready():
	score = 0


func _on_TileGrid_click():
	score += 1
	self.text = str(score)
