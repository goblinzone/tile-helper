extends Area2D
class_name Tile

export var width : int = 100
export var height : int = 100

func _ready():
	$Sprite.set_size(width,height)
	$Shape.set_size(width,height)
	
