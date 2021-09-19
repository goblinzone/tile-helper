extends Node2D
class_name TileGrid

export var width : int = 16
export var height : int = 16

export (PackedScene) var tile_scene

var tiles := []

func _ready():
	create_tile_array()
	position_tiles()


func empty_2d_array(width, height):
	assert(width > 0 and height > 0, "ERROR: width and height must be > 0")
	
	var array = []
	
	for i in range(width):
		array.append([])
		for _j in range(height):
			array[i].append([])
	
	return array


func filled_2d_array(width, height, item):
	assert(width > 0 and height > 0, "ERROR: width and height must be > 0")
	
	var array = empty_2d_array(width,height)
	
	for i in range(width):
		for j in range(height):
			array[i][j] = item
	
	return array


func create_tile_array():
	var array = empty_2d_array(width, height)
	
	for i in range(width):
		for j in range(height):
			var tile = tile_scene.instance()
			add_child(tile)
			array[i][j] = tile
	
	tiles = array


func position_tiles():
	assert(is_instance_valid(tiles[0][0]),"Tiles need to have been declared")
	
	for i in range(width):
		for j in range(height):
			#TODO remove dependency, return centre from tile.
			var tileHeight = tiles[i][j].height
			var tileWidth = tiles[i][j].width
			var tilePosition = Vector2(tileHeight*i, tileWidth*j)
			tiles[i][j].position = tilePosition

