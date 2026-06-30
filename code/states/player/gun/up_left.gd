extends PState


func enter_state(delta:float, input:Inputs):
	gun.rotation_degrees = -135
	gun_sprite.frame = 2

func test(delta:float, input:Inputs) -> String:
	if input.move_dir > 0:
		if not input.inputs.has("up"): return "GunRight"
		if not input.inputs.has("aim_mod"): return "GunUpWalkRight"
		return "GunUpRight"
	if not input.inputs.has("up"): return "GunLeft"
	if not input.inputs.has("aim_mod"): return "GunUpWalkLeft"
	return "okay"
