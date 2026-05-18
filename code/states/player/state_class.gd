extends Node

class_name PState

@export var body: CharacterBody2D

func test(delta:float, input:Inputs) -> String:
	return "okay"

func function(delta:float, input:Inputs):
	pass

func physics_function(delta:float, input:Inputs):
	pass

func enter_state(delta:float, input:Inputs):
	pass

func exit_state(delta:float, input:Inputs):
	pass
