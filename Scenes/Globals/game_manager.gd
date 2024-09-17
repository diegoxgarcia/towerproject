extends Node

var score = 0
var total_score = 0
var enemies_killed = 0

signal update_score(score)
signal update_progress()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy_events")
	pass # Replace with function body.

func on_enemy_dead(score : int):
	total_score += score
	enemies_killed += 1
	update_score.emit(total_score)
	update_progress.emit(enemies_killed)
	
