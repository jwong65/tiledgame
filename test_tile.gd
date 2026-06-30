extends Control

@onready var tile_visual = $TileVisualInstance

func _ready():
	# Test different tiles
	var test_tiles = [
		Tile.new(Tile.Suit.MAN, 5, false),      # Regular Man 5
		Tile.new(Tile.Suit.MAN, 5, true),       # Dora Man 5 (red)
		Tile.new(Tile.Suit.PIN, 3, false),      # Pin 3
		Tile.new(Tile.Suit.SOU, 7, false),      # Sou 7
		Tile.new(Tile.Suit.SEAT, 1, false),     # Ton (East)
		Tile.new(Tile.Suit.DRAGON, 1, false),   # Chun (Red Dragon)
	]
	
	# Display the first one for now
	var test_tile = test_tiles[5]
	tile_visual.set_tile(test_tile)
	print("Loaded tile: ", test_tile)
	print("Image path: ", tile_visual.get_tile_image_path())
