extends PState

const SPEED = 175
var prejump = false
@export var raycast: RayCast2D

func enter_state(delta:float, input:Inputs):
	prejump = false
	if anims.is_playing() and not anims.current_animation == "walk":
		await anims.animation_finished
	await get_tree().create_timer(0.25).timeout
	anims.play("fall")

func test(delta:float, input:Inputs) -> String:
	if raycast.is_colliding() and input.inputs.has("jump"): prejump = true
	if body.is_on_floor():
		if prejump: return "Jump"
		if abs(input.move_dir) < 0.005: return "Idle"
		else: return "Run"
	return "okay"

func physics_function(delta:float, input:Inputs):
	if not body.is_on_floor(): body.velocity += body.get_gravity() * delta
	
	body.velocity.x = SPEED * input.move_dir
	body.move_and_slide()
