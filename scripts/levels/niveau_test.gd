extends Node2D

var stop = false
# Called when the node enters the scene tree for the first time.
func _ready():
	map_2.set_enabled(false)
	get_node("../Page1/ToRight").corps_detecte.connect(_stop)
	get_node("../Page1/ToRight2").corps_detecte.connect(_stop)
	get_node("../Page2/ToRight").corps_detecte.connect(_stop)
	get_node("../Page2/ToRight2").corps_detecte.connect(_stop)
	get_node("../Page3/ToRight").corps_detecte.connect(_stop)
	get_node("../Page3/ToRight2").corps_detecte.connect(_stop)
	get_node("../Page4/ToRight").corps_detecte.connect(_stop)
	get_node("../Page4/ToRight2").corps_detecte.connect(_stop)

func _stop():
	stop = true
	await get_tree().create_timer(4.5).timeout
	stop = false

@onready
var map_1 = $TML_froid
@onready
var map_2 = $TML_chaud
var currentTile = 1
var sfx_number = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	if stop:
		return
		
	if Input.is_action_just_pressed("turn_page_p"):
		if sfx_number == 1:
			$PageTurnSFX.play()
		if sfx_number == 2:
			$PageTurnSFX2.play()
		if sfx_number == 3:
			$PageTurnSFX3.play()
		if sfx_number == 4:
			$PageTurnSFX4.play()
		if sfx_number == 5:
			$PageTurnSFX5.play()
		if sfx_number == 6:
			$PageTurnSFX6.play()
		sfx_number = randi_range(1,6)
		
		if currentTile == 1:
			currentTile = 2
			map_1.set_enabled(false)
			map_2.set_enabled(true)
			$TML_froid/FondFroid.z_index = -2
			$TML_chaud/FondChaud.z_index = -1
		elif currentTile == 2:
			currentTile = 1
			map_2.set_enabled(false)
			map_1.set_enabled(true)
			$TML_chaud/FondChaud.z_index = -2
			$TML_froid/FondFroid.z_index = -1
