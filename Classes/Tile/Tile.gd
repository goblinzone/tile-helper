extends Area2D
class_name Tile

signal clicked(index)

export var width : int = 100
export var height : int = 100
var index : Vector2


func _ready():
	$Sprite.set_size(width,height)
	$Shape.set_size(width,height)


func _on_Tile_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			emit_signal("clicked",index)


func set_index(x,y):
	index = Vector2(x,y)
