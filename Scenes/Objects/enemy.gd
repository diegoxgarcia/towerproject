class_name Enemy
extends PathFollow2D

@export var speed : float = 200
@export var score = 10

signal dead(score)

func _ready():
	dead.connect(GameManager.on_enemy_dead)

func _physics_process(delta):
	progress += delta * speed
	pass

func exploded():
	#get_tree().call_group("enemy_events", "on_enemy_dead", score)
	dead.emit(score)
	set_physics_process(false)
	$ExplodeAnimation.play("explote")
	pass


func _on_explode_animation_animation_finished():
	$ExplodeAnimation.visible = false
	queue_free()
	pass # Replace with function body.
