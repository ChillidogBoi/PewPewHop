extends PState


func enter_state(delta:float, input:Inputs):
	gun.rotation_degrees = 135
	gun_sprite.frame = 3

func test(delta:float, input:Inputs) -> String:
	if input.move_dir > 0:
		if not input.inputs.has("down"): return "GunRight"
		if not input.inputs.has("aim_mod"): return "GunDownWalkRight"
		return "GunDownRight"
	if not input.inputs.has("down"): return "GunLeft"
	if not input.inputs.has("aim_mod"): return "GunDownWalkLeft"
	return "okay"
