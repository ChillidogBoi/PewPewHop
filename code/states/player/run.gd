extends PState

const SPEED = 200
var direction: int = 0

func enter_state(delta:float, input:Inputs):
	direction = Vector2(input.move_dir, 0).normalized().x

func physics_function(delta:float, input:Inputs):
	if Vector2(input.move_dir, 0).normalized().x != direction:
		direction = Vector2(input.move_dir, 0).normalized().x
		if direction == -1: pass # left walking animation
		else: pass # right walking animation
		
	body.velocity.x = input.move_dir * SPEED
	body.move_and_slide()

func test(delta:float, input:Inputs) -> String:
	if input.inputs.has("jump"): return "Jump"
	if not body.is_on_floor(): return "Fall"
	if abs(input.move_dir) < 0.001: return "Idle"
	return "okay"
