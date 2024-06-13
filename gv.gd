extends Node

var points = 0
var mods = {
	"bonus_MULTIBALL" : 1,
	"bonus_GENERIC" : 1
}


func add_points(amount):
	for modifiers in mods.values():
		amount *= modifiers
	points += amount

func add_points_flat(amount):
	points += amount
