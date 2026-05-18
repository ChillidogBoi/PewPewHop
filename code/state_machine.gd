extends Node

@onready var body = get_parent()
@export var cur_state: State

func _process(delta):
	Input.get_axis()
	
	cur_state.test(delta)
