extends AnimatableBody2D

const SPEED = 240
@export var damage = 315

func _ready():
	collision_layer = get_parent().collision_layer
	await get_tree().create_timer(0).timeout
	top_level = true
	print(get_parent().get_child_count(), ": ", global_position)


func _physics_process(delta):
	var t = Vector2(1,0).rotated(global_rotation)
#	print(t)
	global_position += delta * SPEED * t

func free():
	get_parent().current_bullets.erase(self)
