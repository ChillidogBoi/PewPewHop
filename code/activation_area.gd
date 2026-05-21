extends Area2D


func _on_body_entered(body):
	body.find_child("StateMachine").inactive = false
	print(body.find_child("StateMachine").inactive)

func _on_body_exited(body:CollisionObject2D):
	if not body.is_inside_tree(): return
	if body.is_queued_for_deletion(): return
	body.find_child("StateMachine").inactive = true
