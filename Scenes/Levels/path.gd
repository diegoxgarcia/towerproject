extends Path2D

@export var enemy_scene : PackedScene

func _on_timer_timeout():
	_spawn_enemy()
	pass # Replace with function body.
	
func _spawn_enemy():
	var enemy : Enemy = enemy_scene.instantiate()
	add_child(enemy)
	randomize()
	var rand_time = randf_range(2.0,8.0)
	$Timer.wait_time = rand_time
	$Timer.start()
	pass
