extends State

const SPEED = 350

func test(delta:float, input:Inputs) -> String:
	if body.is_on_floor():
		if abs(input.move_dir) < 0.005: return "Idle"
		else: return "Run"
	return "okay"

func physics_function(delta:float, input:Inputs):
	if not body.is_on_floor(): body.velocity += body.get_gravity() * delta
	
	body.velocity.x = SPEED * input.move_dir
	body.move_and_slide()
