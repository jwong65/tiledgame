extends Control
@onready var tile_buttons = [
	$TileHand/TileContainer/Tile1,
	$TileHand/TileContainer/Tile2,
	$TileHand/TileContainer/Tile3,
	$TileHand/TileContainer/Tile4,
	$TileHand/TileContainer/Tile5
]

var selected_tiles = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(tile_buttons.size()):
		tile_buttons[i].pressed.connect(_on_tile_pressed.bind(i))

func _on_tile_pressed(index: int):
	print("Tile %d pressed" % index)
	selected_tiles.append(index)
	tile_buttons[index].modulate = Color.YELLOW  # Highlight selected
	
	if selected_tiles.size() >= 3:
		check_for_match()

func check_for_match():
	print("Checking match with tiles: ", selected_tiles)
	selected_tiles.clear()
	# Reset highlights
	for button in tile_buttons:
		button.modulate = Color.WHITE
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
