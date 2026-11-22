extends Node2D

var stop = false
var page = 1
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
	page += 1
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
		
		hide_all()
		
		if currentTile == 1:
			currentTile = 2
			map_1.set_enabled(false)
			map_2.set_enabled(true)
			if page == 1:
				get_node("../Page1/TML_chaud/FondChaud1").show()
			elif page == 2:
				get_node("../Page2/TML_chaud/FondChaud2").show()
			elif page == 3:
				get_node("../Page3/TML_chaud/FondChaud3").show()
			elif page == 4:
				get_node("../Page4/TML_chaud/FondChaud4").show()
			elif page == 5:
				get_node("../Page5/TML_chaud/FondChaud5").show()
			elif page == 6:
				get_node("../Page6/TML_chaud/FondChaud6").show()
			elif page == 7:
				get_node("../Page7/TML_chaud/FondChaud7").show()
			else:
				get_node("../Page8/TML_chaud/FondChaud8").show()
		elif currentTile == 2:
			currentTile = 1
			map_2.set_enabled(false)
			map_1.set_enabled(true)
			if page == 1:
				get_node("../Page1/TML_froid/FondFroid1").show()
			elif page == 2:
				get_node("../Page2/TML_froid/FondFroid2").show()
			elif page == 3:
				get_node("../Page3/TML_froid/FondFroid3").show()
			elif page == 4:
				get_node("../Page4/TML_froid/FondFroid4").show()
			elif page == 5:
				get_node("../Page5/TML_froid/FondFroid5").show()
			elif page == 6:
				get_node("../Page6/TML_froid/FondFroid6").show()
			elif page == 7:
				get_node("../Page7/TML_froid/FondFroid7").show()
			else:
				get_node("../Page8/TML_froid/FondFroid8").show()


func hide_all():
	get_node("../Page1/TML_chaud/FondChaud1").hide()
	get_node("../Page1/TML_froid/FondFroid1").hide()
	get_node("../Page2/TML_chaud/FondChaud2").hide()
	get_node("../Page2/TML_froid/FondFroid2").hide()
	get_node("../Page3/TML_chaud/FondChaud3").hide()
	get_node("../Page3/TML_froid/FondFroid3").hide()
	get_node("../Page4/TML_chaud/FondChaud4").hide()
	get_node("../Page4/TML_froid/FondFroid4").hide()
	get_node("../Page5/TML_chaud/FondChaud5").hide()
	get_node("../Page5/TML_froid/FondFroid5").hide()
	get_node("../Page6/TML_chaud/FondChaud6").hide()
	get_node("../Page6/TML_froid/FondFroid6").hide()
	get_node("../Page7/TML_chaud/FondChaud7").hide()
	get_node("../Page7/TML_froid/FondFroid7").hide()
	get_node("../Page8/TML_chaud/FondChaud8").hide()
	get_node("../Page8/TML_froid/FondFroid8").hide()
