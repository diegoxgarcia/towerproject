extends CanvasLayer

@onready var score_label = $Main/ScorePanel/ScoreLabel
@onready var wave_progress = $Main/WaveProgress
@onready var wave_progress_label = $Main/WaveProgress/WaveProgressLabel
@onready var spawn_menu = $Main/SpawnMenu
@onready var game_scene = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.update_score.connect(update_score)
	GameManager.update_progress.connect(update_wave_progrees)
	game_scene.map_clicked.connect(on_map_clicked)
	wave_progress_label.text = str(0) + " / " + str(wave_progress.max_value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score(score : int):
	score_label.text = "Score: " + str(score)

func update_wave_progrees(enemy_count : int):
	wave_progress.value = enemy_count
	wave_progress_label.text = str(enemy_count) + " / " + str(wave_progress.max_value)
	pass

func on_map_clicked(pos : Vector2):
	spawn_menu.show()
	spawn_menu.global_position = pos
	
	
	# TODO Hay que spawnear la torreta en la posicion indicada
	# TODO luego hay que hacer desaparecer el menu
	# TODO Si entras dentro del area (mouse_entered) que se abra un menu para moverlo o eliminar
	# TODO o clickeas en la torre y se abre el panel Gui_input con un control sobre la torre
