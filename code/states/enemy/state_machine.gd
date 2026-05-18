extends Node

@export var body: CharacterBody2D
@export var gun: Node2D
@export var move_state: EState
var inputs: Inputs

func _ready():
	for n in get_children():
		n.body = body
	move_state.enter_state(0.0)

func _process(delta):
	var m = move_state.test(delta)
	if m != "okay":
		move_state.exit_state(delta)
		move_state = find_child(m)
		move_state.enter_state(delta)
		return
	
	move_state.function(delta)

func _physics_process(delta):
	move_state.physics_function(delta)
	if Input.is_action_just_pressed("shoot"): gun.shoot()
