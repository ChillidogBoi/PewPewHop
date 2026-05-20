extends Area2D


func _on_body_entered(body):
	body.find_child("StateMachine").inactive = false

func _on_body_exited(body):
	body.find_child("StateMachine").inactive = true
