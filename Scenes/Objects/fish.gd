extends Area2D

@export var fish_data : FishData

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = fish_data.texture
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT * fish_data.speed * delta)
	pass
