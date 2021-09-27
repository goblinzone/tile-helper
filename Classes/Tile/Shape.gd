extends CollisionShape2D

func set_size(width, height):
	var h_extent = float(width) / 2
	var v_extent = float(height) / 2
	var extents = Vector2(h_extent,v_extent)
	self.shape.extents = extents


