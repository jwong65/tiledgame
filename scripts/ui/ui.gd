extends Control

@onready var tile_buttons = [
	$TileHand/TileContainer/TileVisual,
	$TileHand/TileContainer/TileVisual2,
	$TileHand/TileContainer/TileVisual3, 
	$TileHand/TileContainer/TileVisual4, 
	$TileHand/TileContainer/TileVisual5
]

var deck_manager: DeckManager
var current_hand: Array[Tile] = []

func _ready() -> void:
	deck_manager = DeckManager.new()
	draw_new_hand()

func draw_new_hand():
	var tiles = deck_manager.draw_tiles(5)
	current_hand = tiles
	
	# Update each tile visual
	for i in range(5):
		if i < tiles.size():
			tile_buttons[i].set_tile(tiles[i])
	
	print("Drew 5 tiles. Deck size: %d" % [deck_manager.get_deck_size()])
