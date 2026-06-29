extends Node

class_name Tile

enum Suit { PIN, MAN, SOU, SEAT, DRAGON }

var suit: Suit
var number: int  # 1-9 for numbered suits, 1-4 for seats (East, South, West, North), 1-3 for dragons (Red, Green, White)

func _init(p_suit: Suit, p_number: int):
	suit = p_suit
	number = p_number

func _to_string() -> String:
	var suit_name = Suit.keys()[suit]
	return "%s %d" % [suit_name, number]

#func get_image_path() -> String:
	#var suit_folder = Suit.keys()[suit].to_lower()
	#return "res://assets/Regular/%s/%d.png" % [suit_folder, number]
