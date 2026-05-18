extends Resource

class_name InputMap

@export var move_dir: float = 0:
	set(v):
		if v > 1: move_dir = 1
		elif v < -1: move_dir = -1
		else: move_dir = v
@export var inputs: Array[String] = []

func _init(d: float, i: Array[String]):
	move_dir = d
	inputs = i
