extends Node

@export var health = 2
@export var body: CharacterBody2D
@export var gun: Node2D
@export var right_player_check: RayCast2D
@export var left_player_check: RayCast2D
@export var right_ground_check: RayCast2D
@export var left_ground_check: RayCast2D
@export var move_state: EState
@export var sprite: Sprite2D
var inputs: Inputs
var inactive: bool = true
var dir: int = -1
var gunlock: bool = false

func _ready():
	for n in get_children():
		n.body = body
		n.right_ground_check = right_ground_check
		n.left_ground_check = left_ground_check
	move_state.enter_state(0.0)

func _process(delta):
	if inactive: return
	var m = move_state.test(delta)
	if m != "okay":
		move_state.exit_state(delta)
		move_state = find_child(m)
		move_state.enter_state(delta)
		return
	
	move_state.function(delta)

func _physics_process(delta):
	if inactive: return
	move_state.physics_function(delta)
	
	if gunlock: return
	
	if right_player_check.is_colliding() and dir == -1:
		dir = 1
		sprite.flip_h = false
		gun.rotation_degrees = 0
	elif left_player_check.is_colliding() and dir == 1:
		dir = -1
		sprite.flip_h = true
		gun.rotation_degrees = 180
	elif not right_player_check.is_colliding() and not left_player_check.is_colliding(): return
	
	gunlock = true
	
	await get_tree().create_timer(randf_range(0.05, 0.25)).timeout
	gun.shoot()
	
	gunlock = false


func _on_hit_by_bullet(body):
	body.queue_free()
	sprite.modulate = Color.RED
	$"../CollisionDebug".color = Color.WHITE
	health -= 1
	await get_tree().create_timer(0.1).timeout
	sprite.modulate = Color.WHITE
	$"../CollisionDebug".color = Color(0xff000067)
	
	if health < 1: get_parent().queue_free()
