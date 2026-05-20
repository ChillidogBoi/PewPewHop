extends EState


func enter_state(delta:float):
	pass #idle animation here

func test(delta:float) -> String:
	var r = randi_range(0, 5) == 0
	if not body.is_on_floor(): return "Fall"
	if r == 3 or r == 2:
		if not left_ground_check.is_colliding() and right_ground_check.is_colliding(): return "RunRight"
		elif left_ground_check.is_colliding() and not right_ground_check.is_colliding(): return "RunLeft"
	elif r == 5: return "Jump"
	return "okay"
