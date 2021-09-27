extends Sprite

func set_size(width,height):
	var scale_x = float(width) / texture.get_width()
	var scale_y = float(height) / texture.get_height()
	scale = (Vector2(scale_x, scale_y))
