extends Node

class_name PState

@export var body: CharacterBody2D
@export var gun: Node2D
@export var anims: AnimationPlayer
@export var gun_sprite: Sprite2D

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
