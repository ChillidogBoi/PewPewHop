extends AnimatableBody2D

const SPEED = 400

func _ready():
	global_rotation = get_parent().global_rotation
	global_position = get_parent().global_position

func _physics_process(delta):
	global_position.x += delta * SPEED
