extends "res://Classes/Tile/Sprite.gd"

const ON_PATH = "res://LightsOff/LightsOffTile/on.png"
const OFF_PATH = "res://LightsOff/LightsOffTile/off.png"

func _ready():
	pass


func update_sprite(is_on:bool):
	var texture_path = ON_PATH if is_on else OFF_PATH	
	self.texture = load(texture_path)


func _on_Tile_toggle(is_on):
	update_sprite(is_on)
