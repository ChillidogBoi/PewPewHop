extends PState

func enter_state(delta:float, input:Inputs):
	gun.rotation_degrees = 90
	gun_sprite.frame = 4

func test(delta:float, input:Inputs) -> String:
	if input.move_dir > 0:
		if not input.inputs.has("down"): return "GunRight"
		if input.inputs.has("aim_mod"): return "GunDownRight"
		return "GunDownWalkRight"
	if not input.inputs.has("down"): return "GunLeft"
	if input.inputs.has("aim_mod"): return "GunDownLeft"
	return "okay"
