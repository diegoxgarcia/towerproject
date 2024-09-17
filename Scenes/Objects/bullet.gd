class_name Bullet
extends Area2D

@export var speed : float = 400

var direction : Vector2

func set_direction(dir : Vector2):
	direction = dir
	pass

func _physics_process(delta):
	translate(direction * speed * delta)
	pass

func _on_area_entered(area):
	var enemy : Enemy = area.get_parent() as Enemy
	enemy.exploded()
	queue_free()
	pass # Replace with function body.
