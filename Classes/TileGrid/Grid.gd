extends Node2D
class_name TileGrid

signal won()
signal click()
signal randomized(n)

export var width : int = 16
export var height : int = 16

export (PackedScene) var tile_scene

var tiles := []

func _ready():
	create_tile_array()
	position_tiles()
	randomize_layout(10)

func _on_TileGrid_won():
	#column dance
	for p in range(10):
		for i in range(width):
			for j in range(height):
					tiles[i][j].toggle()
		yield(get_tree().create_timer(1.0), "timeout")


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
			tile.connect("clicked", self, "cross_press")
			tile.set_index(i,j)
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


func toggle_tile(x,y):
	tiles[x][y].call("toggle")


func cross_press(loc):
	emit_signal("click")
	var x = loc.x
	var y = loc.y
	
	toggle_tile(x,y)
	
	if x > 0:
		toggle_tile(x - 1, y)
	if x < width - 1:
		toggle_tile(x + 1, y)
	if y > 0:
		toggle_tile(x, y - 1)
	if y < height - 1:
		toggle_tile(x, y + 1)
	
	if is_all_off():
		emit_signal("won")


func is_all_off():
	for i in range(width):
		for j in range(height):
			if tiles[i][j].is_on:
				return false
	return true

func randomize_layout(num_toggles:int):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	for i in range(num_toggles):
		var rand_row = rng.randi_range(0, height-1)
		var rand_col = rng.randi_range(0, width-1)
		toggle_tile(rand_col, rand_row)
	
	emit_signal("randomized",num_toggles)

func reset(num_toggles:int):
	clear()
	randomize_layout(num_toggles)

func clear():
	for i in range(width):
		for j in range(height):
			tiles[i][j].call("turn_off")

func _on_Reset_Button_reset():
	reset(10)
