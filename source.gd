extends Node2D

var ticktick = 0
@onready var tri_left_start = $MachineColliders/TRILEFT.global_position
@onready var tri_right_start = $MachineColliders/TRIRIGHT.global_position
var packedball = preload("res://ball.tscn")

func _physics_process(delta):
	
	ticktick += 1
	$MachineColliders/TRILEFT.global_position = tri_left_start + Vector2(0, cos(deg_to_rad(ticktick * 1))*150)
	$MachineColliders/TRIRIGHT.global_position = tri_right_start + Vector2(0, sin(deg_to_rad(ticktick * 1))*150)

	
	
	if Input.is_action_just_pressed('ENTER'):
		var new_ball : RigidBody2D = packedball.instantiate()
		var pick = $Spawns.get_children().pick_random()
		new_ball.global_position = pick.global_position
		new_ball.modulate = Color(randf(), randf(), randf())*0.5+Color(0.5,0.5,0.5)
		$BALLS.add_child(new_ball)
	
	var a_pressed = Input.is_action_pressed("A")
	var d_pressed = Input.is_action_pressed("D")
	
	if a_pressed:
		$MachineColliders/LBAR.rotation = lerp($MachineColliders/LBAR.rotation, deg_to_rad(-20), 0.4)
	else:
		$MachineColliders/LBAR.rotation = lerp($MachineColliders/LBAR.rotation, deg_to_rad(25), 0.2)
	if d_pressed:
		$MachineColliders/RBAR.rotation = lerp($MachineColliders/RBAR.rotation, deg_to_rad(20), 0.4)
	else:
		$MachineColliders/RBAR.rotation = lerp($MachineColliders/RBAR.rotation, deg_to_rad(-25), 0.2)
	
	var string1 : String = str(gv.points)
	var string2 : String
	for i in 10-string1.length():
		string2 += "0"
	$GUI/PointDisplay.text = str("\n","[color=darkGray]",string2,"[/color]", string1)
