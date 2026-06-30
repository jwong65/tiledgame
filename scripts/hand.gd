class_name HandManager
extends Control

@export var tile_scene: PackedScene = preload("res://scenes/tile_visual.tscn")
@export var tiles_per_row: int = 5
@export var spacing: int = 10

var hand: Array[Tile] = []
var tile_visuals: Array[Control] = []

@onready var hand_container = $HandContainer

func _ready():
	# Set up the container
	hand_container.columns = tiles_per_row

func add_tiles(tiles: Array[Tile]):
	# Clear old tiles
	for visual in tile_visuals:
		visual.queue_free()
	tile_visuals.clear()
	hand.clear()
	
	# Add new tiles
	for tile in tiles:
		hand.append(tile)
		var tile_visual = tile_scene.instantiate()
		tile_visual.set_tile(tile)
		hand_container.add_child(tile_visual)
		tile_visuals.append(tile_visual)

func clear_hand():
	for visual in tile_visuals:
		visual.queue_free()
	tile_visuals.clear()
	hand.clear()

func get_hand() -> Array[Tile]:
	return hand.duplicate()
