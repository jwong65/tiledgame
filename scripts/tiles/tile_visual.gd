extends Control

@onready var back = $Back
@onready var front  = $Front

var tile: Tile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_tile(p_tile: Tile):
	tile = p_tile
	update_display()


func update_display():
	# Set back (always the same)
	back.texture = load("res://assets/tiles/Regular/Front.svg")
	
	# Set front based on tile
	front.texture = load(get_tile_image_path())

func get_tile_image_path() -> String:
	var suit_name = Tile.Suit.keys()[tile.suit].to_lower()
	
	# Handle numbered suits (pin, man, sou)
	if tile.suit in [Tile.Suit.PIN, Tile.Suit.MAN, Tile.Suit.SOU]:
		var suit_folder = suit_name
		var suit_display = suit_name.capitalize()
		
		# Red 5s
		if tile.number == 5 and tile.is_dora:
			return "res://assets/tiles/Regular/%s/%s5-Dora.svg" % [suit_folder, suit_display]
		
		# Regular 5s and all other numbers
		return "res://assets/tiles/Regular/%s/%s%d.svg" % [suit_folder, suit_display, tile.number]
	
	# Handle seat/wind tiles
	if tile.suit == Tile.Suit.SEAT:
		var seat_names = ["Ton", "Nan", "Shaa", "Pei"]  # East, South, West, North
		return "res://assets/tiles/Regular/seats/%s.svg" % seat_names[tile.number - 1]
	
	# Handle dragon tiles
	if tile.suit == Tile.Suit.DRAGON:
		var dragon_names = ["Chun", "Hatsu", "Haku"]  # Red, Green, White
		return "res://assets/tiles/Regular/dragon/%s.svg" % dragon_names[tile.number - 1]
	
	return "res://assets/tiles/Regular/Front.svg"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
