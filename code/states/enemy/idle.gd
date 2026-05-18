extends EState


func enter_state(delta:float):
	pass #idle animation here

func test(delta:float) -> String:
	if input.inputs.has("jump"): return "Jump"
	if not body.is_on_floor(): return "Fall"
	if abs(input.move_dir) > 0.01: return "Run"
	return "okay"
