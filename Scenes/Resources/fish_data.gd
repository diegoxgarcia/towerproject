class_name FishData
extends Resource

enum Rarity { NORMAL, RARE, EPIC, LEGENDARY, UNIQUE }
enum Bait { WORM, FLY, BREAD, HUMAN, EEL }

@export var texture : Texture
@export var min_threshold : float
@export var weight : float
@export var longitude : float
@export var rarity : Rarity
@export var speed : float
@export var name : String
@export var aggressivity : float
@export var bait_type : Bait
@export var power : PackedScene #Esto puede ser una bala por ej.
