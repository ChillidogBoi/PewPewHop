extends Node

class_name EState

@export var body: CharacterBody2D
@export var left_ground_check: RayCast2D
@export var right_ground_check: RayCast2D

func test(delta:float) -> String:
	return "okay"

func function(delta:float):
	pass

func physics_function(delta:float):
	pass

func enter_state(delta:float):
	pass

func exit_state(delta:float):
	pass
