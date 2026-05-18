extends State

var POWER = 20
var frames_left = 15

func enter_state(delta:float, input:Inputs):
	frames_left = 15
	body.velocity.y = -150

func physics_function(delta:float, input:Inputs):
	body.move_and_slide()
	body.velocity.y -= POWER
	frames_left -= 1

func test(delta:float, input:Inputs) -> String:
	if frames_left < 1 or not input.inputs.has("higher_jump"): return "Fall"
	else: return "okay"
