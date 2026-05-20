extends Node

@export var healthbar: ProgressBar
@export var sprite: Sprite2D
@export var body: CharacterBody2D
@export var gun: Node2D
@export var move_state: PState
var inputs: Inputs
var health = 5

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
	
func _on_hit_by_bullet(body):
	body.queue_free()
	sprite.modulate = Color.RED
	healthbar.value -= 1
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color.WHITE
	if healthbar.value < 1: get_tree().quit()
