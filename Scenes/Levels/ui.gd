extends CanvasLayer

@onready var score_label = $Main/ScorePanel/ScoreLabel
@onready var wave_progress = $Main/WaveProgress
@onready var wave_progress_label = $Main/WaveProgress/WaveProgressLabel
@onready var spawn_menu = $Main/SpawnMenu
@onready var game_scene = $".."
@onready var tower = $"../Tower"
@onready var tower_menu = $Main/TowerMenu
@onready var tower_2 = $"../Tower2"

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.update_score.connect(update_score)
	GameManager.update_progress.connect(update_wave_progrees)
	game_scene.map_clicked.connect(on_map_clicked)
	tower.tower_clicked.connect(on_tower_clicked)
	tower_2.tower_clicked.connect(on_tower_clicked)
	wave_progress_label.text = str(0) + " / " + str(wave_progress.max_value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score(score : int):
	score_label.text = "Score: " + str(score)
	pass

func update_wave_progrees(enemy_count : int):
	wave_progress.value = enemy_count
	wave_progress_label.text = str(enemy_count) + " / " + str(wave_progress.max_value)
	pass

func on_map_clicked(pos : Vector2):
	spawn_menu.show()
	spawn_menu.global_position = pos
	pass
	
func _on_game_scene_tower_created():
	spawn_menu.hide()
	pass # Replace with function body.
	
## TODO ver de llevar la creacion de la UI dentro de tower. Pensarlo en mobile
## TODO Hacerla instanciable a la ClickArea de la Tower para poder emitir una señal a la hora de borrar la misma torre
func on_tower_clicked(tower : Area2D):
	tower_menu.show()
	tower_menu.global_position = tower.position
	game_scene.tower_selected = tower
	pass
