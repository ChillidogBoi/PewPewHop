extends PState


func enter_state(delta:float, input:Inputs):
	gun.rotation_degrees = -90
	gun_sprite.frame = 1

func test(delta:float, input:Inputs) -> String:
	if input.move_dir < 0:
		if not input.inputs.has("up"): return "GunLeft"
		if input.inputs.has("aim_mod"): return "GunUpLeft"
		return "GunUpWalkLeft"
	if not input.inputs.has("up"): return "GunRight"
	if input.inputs.has("aim_mod"): return "GunUpRight"
	return "okay"
