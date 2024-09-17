extends Area2D
 
signal enemy_entered(enemy)
signal enemy_exited(enemy)

func _on_area_entered(area):
	var enemy : Enemy = area.get_parent() as Enemy
	enemy_entered.emit(enemy)
	pass # Replace with function body.


func _on_area_exited(area):
	var enemy : Enemy = area.get_parent() as Enemy
	enemy_exited.emit(enemy)
	pass # Replace with function body.
	
func set_attack_radius(radius: float):
	get_child(0).shape.radius = radius
	pass
