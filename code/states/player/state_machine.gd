extends Node

@export var gun_state_machine: Node
@export var healthbar: Label
@export var sprite: Sprite2D
@export var body: CharacterBody2D
@export var gun: Node2D
@export var gun_sprite: Sprite2D
@export var anims: AnimationPlayer
@export var move_state: PState
@export var gun_state: PState
var inputs: Inputs
var health = 5

func _ready():
	for n in get_children():
		n.body = body
		n.anims = anims
	for n in gun_state_machine.get_children():
		n.gun = gun
		n.gun_sprite = gun_sprite
	var t = Inputs.new(0.0, [])
	move_state.enter_state(0.0, t)

func _process(delta):
	var a: Array[String] = []
	var right_x_vals = [0]
	for n in Input.get_connected_joypads():
		right_x_vals.append(abs(Input.get_joy_axis(n, 2)))
	if Input.is_action_just_pressed("jump"): a.append("jump")
	elif Input.is_action_pressed("jump"): a.append("higher_jump")
	if Input.is_action_pressed("up"): a.append("up")
	if Input.is_action_pressed("down"): a.append("down")
	if Input.is_action_pressed("aim_mod") or right_x_vals.max() > 0.25: a.append("aim_mod")
	inputs = Inputs.new(Vector2(Input.get_axis("left", "right"), 0).normalized().x, a)
	
	var m = move_state.test(delta, inputs)
	if m != "okay":
		move_state.exit_state(delta, inputs)
		move_state = find_child(m)
		move_state.enter_state(delta, inputs)
		return
	move_state.function(delta, inputs)
	
	var g = gun_state.test(delta, inputs)
	if g != "okay":
		print(g)
		gun_state = gun_state_machine.find_child(g)
		gun_state.enter_state(delta, inputs)
	

func _physics_process(delta):
	move_state.physics_function(delta, inputs)
	if Input.is_action_just_pressed("shoot"): gun.shoot()

	if inputs == null: return
	if inputs.move_dir < 0 and not sprite.flip_h:
		sprite.flip_h = true
		gun_sprite.flip_h = true
		return
	elif inputs.move_dir > 0 and sprite.flip_h:
		sprite.flip_h = false
		gun_sprite.flip_h = false
		return
	
func _on_hit_by_bullet(Nbody):
	sprite.modulate = Color.RED
	gun_sprite.modulate = Color.RED
	healthbar.value -= Nbody.damage
	Nbody.queue_free()
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color.WHITE
	gun_sprite.modulate = Color.WHITE
	if healthbar.value < 1: get_tree().quit()
