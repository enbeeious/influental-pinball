extends RigidBody2D

var tween
var rotm = 0

func _ready():
	tween = create_tween()
	tween.stop()
	body_entered.connect(BOING)

func _physics_process(delta):
	$THIS.rotation_degrees += rotm
	rotm *= 0.99

func BOING(body):
	if not body.has_meta("ball"):
		return
	
	rotm += (randf()-0.5)*5 + rotm / 2
	gv.add_points(10)
	var ball : RigidBody2D = body
	
	ball.apply_central_impulse((ball.global_position - global_position).normalized() * 512)
	
	if tween.is_running():
		tween.kill()
	tween = create_tween()
	$THIS.scale = Vector2(1.5, 1.5)
	tween.tween_property($THIS, "scale", Vector2(1, 1), 0.1)
	tween.play()
