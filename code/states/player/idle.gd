extends PState


func test(delta:float, input:Inputs) -> String:
	if input.inputs.has("jump"): return "SuperJump"
	if not body.is_on_floor(): return "Fall"
	if abs(input.move_dir) > 0.01: return "Run"
	return "okay"

func enter_state(delta:float, input:Inputs):
	anims.play("idle")
