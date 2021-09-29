extends Tile

signal toggle(is_on)

var is_on = false

func _ready():
	connect("clicked", self, "_on_Tile_clicked")


func toggle():
	is_on = !is_on
	emit_signal("toggle",is_on)


func turn_off():
	is_on = false
	emit_signal("toggle",is_on)

func is_adjacent(position):
	var x_adjacent = abs(position.x - index.x) == 1
	var y_adjacent = abs(position.y - index.y) == 1
	var corner = x_adjacent and y_adjacent
	
	return (x_adjacent or y_adjacent) and !corner
