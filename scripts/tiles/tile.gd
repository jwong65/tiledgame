extends Node

class_name Tile

enum Suit { PIN, MAN, SOU, SEAT, DRAGON }

var suit: Suit
var number: int
var is_dora: bool

func _init(p_suit: Suit, p_number: int, p_is_dora: bool = false):
	suit = p_suit
	number = p_number
	is_dora = p_is_dora

func _to_string() -> String:
	var suit_name = Suit.keys()[suit]
	return "%s %d%s" % [suit_name, number, " (Dora)" if is_dora else ""]

func get_image_path() -> String:
	var suit_folder = Suit.keys()[suit].to_lower()
	return "res://assets/Regular/%s/%d.svg" % [suit_folder, number]
