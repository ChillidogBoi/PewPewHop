extends AnimatableBody2D

const SPEED = 550

func _ready():
	global_rotation = get_parent().global_rotation
	global_position = get_parent().global_position
	collision_layer = get_parent().collision_layer

func _physics_process(delta):
	global_position.x += delta * SPEED

func free():
	get_parent().current_bullets.erase(self)
