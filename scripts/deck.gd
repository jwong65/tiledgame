class_name DeckManager
extends Node

var deck: Array[Tile] = []

func _init():
	build_deck()
	shuffle_deck()

func build_deck():
	deck.clear()
	var suits = [Tile.Suit.PIN, Tile.Suit.MAN, Tile.Suit.SOU]
	
	# Numbered tiles 1-9, 4 of each
	for suit in suits:
		for value in range(1, 10):
			if value == 5:
				# One red 5 (dora)
				deck.append(Tile.new(suit, value, true))
				# Three regular 5s
				for i in range(3):
					deck.append(Tile.new(suit, value, false))
			else:
				# Four of each number
				for i in range(4):
					deck.append(Tile.new(suit, value, false))
	
	# Seat tiles (East, South, West, North) - 4 of each
	var seats = [Tile.Suit.SEAT]
	for seat in seats:
		for value in range(1, 5):
			for i in range(4):
				deck.append(Tile.new(seat, value, false))
	
	# Dragon tiles (Red, Green, White) - 4 of each
	var dragons = [Tile.Suit.DRAGON]
	for dragon in dragons:
		for value in range(1, 4):
			for i in range(4):
				deck.append(Tile.new(dragon, value, false))

func shuffle_deck():
	deck.shuffle()

func draw_tile() -> Tile:
	if deck.is_empty():
		push_error("Deck is empty!")
		return null
	return deck.pop_front()

func draw_tiles(count: int) -> Array[Tile]:
	var tiles: Array[Tile] = []
	for i in range(count):
		var tile = draw_tile()
		if tile:
			tiles.append(tile)
	return tiles

func reset():
	build_deck()
	shuffle_deck()

func get_deck_size() -> int:
	return deck.size()
