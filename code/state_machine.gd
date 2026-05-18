extends Node

@export var body: CharacterBody2D
@export var gun: Node2D
@export var move_state: State
@export var gun_state: State
var inputs: Inputs

func _ready():
	for n in get_children():
		n.body = body
	var t = Inputs.new(0.0, [])
	move_state.enter_state(0.0, t)

func _process(delta):
	var a: Array[String] = []
	if Input.is_action_just_pressed("jump"): a.append("jump")
	elif Input.is_action_pressed("jump"): a.append("higher_jump")
	if Input.is_action_just_pressed("up"): a.append("up")
	inputs = Inputs.new(Input.get_axis("left", "right"), a)
	
	var m = move_state.test(delta, inputs)
	if m != "okay":
		move_state.exit_state(delta, inputs)
		move_state = find_child(m)
		move_state.enter_state(delta, inputs)
		return
	
	move_state.function(delta, inputs)

func _physics_process(delta):
	move_state.physics_function(delta, inputs)
	if Input.is_action_just_pressed("shoot"): gun.shoot()
