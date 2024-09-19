class_name Tower
extends Area2D

@export var attack_radius : float:
	get():
		return attack_radius
	set(new_radius):
		attack_radius = new_radius
		# No utilizar recurso porque se modifica en todos
		$AttackArea/CollisionShape2D.shape.radius = attack_radius
		
@export var bullet_scene : PackedScene
@onready var shoot_timer : Timer = $ShootTimer
@onready var animation_player = $AnimationPlayer

var enemies : Array[Enemy] = []
var can_shoot : bool = true
signal tower_clicked(tower : Tower)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackArea.enemy_entered.connect(_on_enemy_entered)
	$AttackArea.enemy_exited.connect(_on_enemy_exited)
	set_process(false)
	#Duplicamos el recurso
	#var new_shape = $AttackArea/CollisionShape2D.shape.duplicate()
	#Seteamos el radio
	#$AttackArea/CollisionShape2D.shape.radius = attack_radius
	#Seteamos el shape nuevo (esto es para no duplicar el radio)
	#$AttackArea/CollisionShape2D.shape = new_shape
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if enemies.is_empty(): return
	$Turret.look_at(enemies.front().global_position)
	pass

func _on_enemy_entered(enemy : Enemy):
	enemies.append(enemy)
	# Habilito el process
	set_process(true)
	_attack_enemy()
	pass
	
func _on_enemy_exited(enemy : Enemy):
	enemies.erase(enemy)
	if enemies.is_empty():
		# Deshabilito el process
		set_process(false)
	pass

# Que dispare en base a un tiempo (Nodo timer)
# Hacer un splash explotion (activar collition o no)
func _attack_enemy():
	if not can_shoot:return
	can_shoot = false
	var enemy : Enemy = enemies.front()
	var bullet : Bullet = bullet_scene.instantiate()
	#get_tree().root.add_child(bullet)
	# Lo agrega cuando puede, se recomienda cuando se utiliza un add_child dentro de una señal
	get_tree().root.add_child.call_deferred(bullet)
	bullet.global_position = $Turret/ShootPosition.global_position
	animation_player.play("shoot")
	bullet.set_direction(global_position.direction_to(enemy.global_position))
	shoot_timer.start()
	pass


func _on_shoot_timer_timeout():
	can_shoot = true
	if not enemies.is_empty():
		_attack_enemy()	
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "shoot":
		animation_player.play("idle")
	pass # Replace with function body.


func _on_click_area_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
			tower_clicked.emit(self)
	pass # Replace with function body.
