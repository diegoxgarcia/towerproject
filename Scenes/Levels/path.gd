extends Path2D

@export var enemy_scene : PackedScene

func _on_timer_timeout():
	_spawn_enemy()
	pass # Replace with function body.
	
func _spawn_enemy():
	var enemy : Enemy = enemy_scene.instantiate()
	enemy.speed = randf_range(200.0, 400.0)
	add_child(enemy)
	randomize()
	var rand_time = randf_range(1.0,2.0)
	$Timer.wait_time = rand_time
	$Timer.start()
	pass
