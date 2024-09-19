extends Node2D

var tower = preload("res://Scenes/Objects/tower.tscn")

signal map_clicked(pos)
signal tower_created()
signal tower_removed()
var tower_selected = null
@onready var ui = $UI

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MOUSE_BUTTON_RIGHT:
			map_clicked.emit(get_global_mouse_position())
	pass
	
func _on_spawn_tower_pressed():
	var new_tower = tower.instantiate()
	new_tower.position = get_global_mouse_position()
	tower_created.emit()
	get_tree().root.add_child.call_deferred(new_tower)
	new_tower.tower_clicked.connect(ui.on_tower_clicked)
	pass # Replace with function body.

func _on_move_tower_pressed():
	pass # Replace with function body.

func _on_remove_tower_pressed():
	tower_selected.queue_free()
	pass # Replace with function body.
