extends PState

func enter_state(delta:float, input:Inputs):
	gun.rotation_degrees = 180
	gun_sprite.frame = 0

func test(delta:float, input:Inputs) -> String:
	if input.move_dir > 0: return "GunRight"
	if input.inputs.has("up"):
		if input.inputs.has("aim_mod"): return "GunUpLeft"
		else: return "GunUpWalkLeft"
	if input.inputs.has("down"):
		if input.inputs.has("aim_mod"): return "GunDownLeft"
		else: return "GunDownWalkLeft"
	return "okay"
