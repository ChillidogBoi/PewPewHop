extends PState


func enter_state(delta:float, input:Inputs):
	gun.rotation_degrees = 0
	gun_sprite.frame = 0

func test(delta:float, input:Inputs) -> String:
	if input.move_dir < 0: return "GunLeft"
	if input.inputs.has("up"):
		if input.inputs.has("aim_mod"): return "GunUpRight"
		else: return "GunUpWalkRight"
	if input.inputs.has("down"):
		if input.inputs.has("aim_mod"): return "GunDownRight"
		else: return "GunDownWalkRight"
	return "okay"
