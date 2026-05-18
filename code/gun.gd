extends Node2D

@export_flags_2d_physics var collision_layer

var bullet_scene: PackedScene = preload("uid://c3caypuyf6grc")
var current_bullets = []
var cool = false

func shoot():
	if cool:
		print("Misfire! Fire slower.")
		return
	if current_bullets.size() > 15: current_bullets.remove_at(0)
	var new_bullet = bullet_scene.instantiate()
	add_child(new_bullet)
	current_bullets.append(new_bullet)
	cool = true
	await get_tree().create_timer(0.05).timeout
	cool = false
