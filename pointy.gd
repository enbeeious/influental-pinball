extends Area2D

func _ready():
	body_entered.connect(pointspls)

func pointspls(body):
	if body.has_meta("ball"):
		gv.add_points(15)
