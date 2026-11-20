extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

@onready
var map_1 = get_node("TileMapLayer")
@onready
var map_2 = get_node("TileMapLayer2")
var currentTile = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("turn_page_p"):
		if currentTile == 1:
			currentTile = 2
			map_1.set_enabled(false)
			map_2.set_enabled(true)
		elif currentTile == 2:
			currentTile = 1
			map_2.set_enabled(false)
			map_1.set_enabled(true)
