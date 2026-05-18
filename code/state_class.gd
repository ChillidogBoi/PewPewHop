extends Node

class_name State

@export var body: CharacterBody2D

func test(delta:float, input:InputMap):
	return "okay"

func function(delta:float, input:InputMap):
	pass

func physics_function(delta:float, input:InputMap):
	pass

func enter_state(delta:float, input:InputMap):
	pass

func exit_state(delta:float, input:InputMap):
	pass
