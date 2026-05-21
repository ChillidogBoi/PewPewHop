extends AnimatableBody2D

const SPEED = 550

func _ready():
	collision_layer = get_parent().collision_layer
	await get_tree().create_timer(0).timeout
	top_level = true
	print(get_parent().get_child_count(), ": ", global_position)


func _physics_process(delta):
	var t = (1 + ((global_rotation_degrees / 180) * -2))
	print(t)
	global_position.x += delta * SPEED * t

func free():
	get_parent().current_bullets.erase(self)
