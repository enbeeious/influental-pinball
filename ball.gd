extends RigidBody2D

var collide_vfx_1 = preload("res://collide_vfx_1.tscn")
var lastvel = Vector2(0, 0)

func _on_body_entered(body):
	if not lastvel.length() > 100:
		return
	var popper = collide_vfx_1.instantiate()
	$/root/source.add_child(popper)
	popper.global_position = global_position
	popper.look_at(global_position - lastvel)
	popper.finished.connect(DESTROY.bind(popper))
	popper.emitting = true
	for i in popper.get_children():
		i.emitting = true
	print("HELLO!!!")

func DESTROY(thing):
	thing.queue_free()

func _physics_process(delta):
	lastvel = linear_velocity
