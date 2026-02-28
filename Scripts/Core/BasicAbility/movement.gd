class_name Movement extends Node

@export
var controller:CharacterBody2D

@export
var speed:float = 400

func move(dir: Vector2):
	if not controller: return
	
	controller.velocity.x = dir.x * speed
	controller.move_and_slide()
