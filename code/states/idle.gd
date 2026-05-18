extends State


func test(delta:float, input:Inputs) -> String:
	if input.inputs.has("jump"): return "Jump"
	if not body.is_on_floor(): return "Fall"
	if abs(input.move_dir) > 0.01: return "Run"
	return "okay"

func enter_state(delta:float, input:Inputs):
	pass # play idle animation here
