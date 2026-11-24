extends AnimatedSprite2D

var page = 1
var recto = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Cache l'anim au début
	hide()
	get_node("../../Page2/PageTurnAnim2").hide()
	get_node("../../Page3/PageTurnAnim2").hide()
	get_node("../../Page4/PageTurnAnim2").hide()
	get_node("../../Page5/PageTurnAnim2").hide()
	get_node("../../Page6/PageTurnAnim2").hide()
	get_node("../../Page7/PageTurnAnim2").hide()
	get_node("../../Page8/PageTurnAnim2").hide()
	# Connections
	get_node("../../Page1/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page1/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page2/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page2/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page3/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page3/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page4/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page4/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page5/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page5/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page6/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page6/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page7/ToRight").corps_detecte.connect(_move_anim)
	get_node("../../Page7/ToRight2").corps_detecte.connect(_move_anim)
	get_node("../../Page8/ToRight").corps_detecte.connect(_move_anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("turn_page_p"):
		if recto:
			flip_h = false
			recto = false
		else:
			flip_h = true
			recto = true
		if page == 1:
			get_node("../../Page1/PageTurnAnim").show()
			get_node("../../Page1/PageTurnAnim").play("PageTurn")
			if !recto:
				get_node("../../Page1/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page1/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 2:
			if !recto:
				get_node("../../Page2/PageTurnAnim2").flip_h = false
				get_node("../../Page2/PageTurnAnim2").show()
				get_node("../../Page2/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page2/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page2/PageTurnAnim2").flip_h = true
				get_node("../../Page2/PageTurnAnim2").show()
				get_node("../../Page2/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page2/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 3:
			if !recto:
				get_node("../../Page2/PageTurnAnim").show()
				get_node("../../Page2/PageTurnAnim").play("PageTurn")
				get_node("../../Page2/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page2/PageTurnAnim").show()
				get_node("../../Page2/PageTurnAnim").play("PageTurn")
				get_node("../../Page2/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 4:
			if !recto:
				get_node("../../Page3/PageTurnAnim2").flip_h = false
				get_node("../../Page3/PageTurnAnim2").show()
				get_node("../../Page3/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page3/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page3/PageTurnAnim2").flip_h = true
				get_node("../../Page3/PageTurnAnim2").show()
				get_node("../../Page3/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page3/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 5:
			if !recto:
				get_node("../../Page3/PageTurnAnim").show()
				get_node("../../Page3/PageTurnAnim").play("PageTurn")
				get_node("../../Page3/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page3/PageTurnAnim").show()
				get_node("../../Page3/PageTurnAnim").play("PageTurn")
				get_node("../../Page3/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 6:
			if !recto:
				get_node("../../Page4/PageTurnAnim2").flip_h = false
				get_node("../../Page4/PageTurnAnim2").show()
				get_node("../../Page4/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page4/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page4/PageTurnAnim2").flip_h = true
				get_node("../../Page4/PageTurnAnim2").show()
				get_node("../../Page4/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page4/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 7:
			if !recto:
				get_node("../../Page4/PageTurnAnim").show()
				get_node("../../Page4/PageTurnAnim").play("PageTurn")
				get_node("../../Page4/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page4/PageTurnAnim").show()
				get_node("../../Page4/PageTurnAnim").play("PageTurn")
				get_node("../../Page4/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 8:
			if !recto:
				get_node("../../Page5/PageTurnAnim2").flip_h = false
				get_node("../../Page5/PageTurnAnim2").show()
				get_node("../../Page5/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page5/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page5/PageTurnAnim2").flip_h = true
				get_node("../../Page5/PageTurnAnim2").show()
				get_node("../../Page5/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page5/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 9:
			if !recto:
				get_node("../../Page5/PageTurnAnim").show()
				get_node("../../Page5/PageTurnAnim").play("PageTurn")
				get_node("../../Page5/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page5/PageTurnAnim").show()
				get_node("../../Page5/PageTurnAnim").play("PageTurn")
				get_node("../../Page5/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 10:
			if !recto:
				get_node("../../Page6/PageTurnAnim2").flip_h = false
				get_node("../../Page6/PageTurnAnim2").show()
				get_node("../../Page6/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page6/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page6/PageTurnAnim2").flip_h = true
				get_node("../../Page6/PageTurnAnim2").show()
				get_node("../../Page6/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page6/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 11:
			if !recto:
				get_node("../../Page6/PageTurnAnim").show()
				get_node("../../Page6/PageTurnAnim").play("PageTurn")
				get_node("../../Page6/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page6/PageTurnAnim").show()
				get_node("../../Page6/PageTurnAnim").play("PageTurn")
				get_node("../../Page6/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 12:
			if !recto:
				get_node("../../Page7/PageTurnAnim2").flip_h = false
				get_node("../../Page7/PageTurnAnim2").show()
				get_node("../../Page7/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page7/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page7/PageTurnAnim2").flip_h = true
				get_node("../../Page7/PageTurnAnim2").show()
				get_node("../../Page7/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page7/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 13:
			if !recto:
				get_node("../../Page7/PageTurnAnim").show()
				get_node("../../Page7/PageTurnAnim").play("PageTurn")
				get_node("../../Page7/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page7/PageTurnAnim").show()
				get_node("../../Page7/PageTurnAnim").play("PageTurn")
				get_node("../../Page7/PageTurnAnim/AnimationPlayer").play("move_anim_left")
		elif page == 14:
			if !recto:
				get_node("../../Page8/PageTurnAnim2").flip_h = false
				get_node("../../Page8/PageTurnAnim2").show()
				get_node("../../Page8/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page8/PageTurnAnim2/AnimationPlayer2").play("move_anim_right_2")
			else:
				get_node("../../Page8/PageTurnAnim2").flip_h = true
				get_node("../../Page8/PageTurnAnim2").show()
				get_node("../../Page8/PageTurnAnim2").play("PageTurn2")
				get_node("../../Page8/PageTurnAnim2/AnimationPlayer2").play("move_anim_left_2")
		elif page == 15:
			if !recto:
				get_node("../../Page8/PageTurnAnim").show()
				get_node("../../Page8/PageTurnAnim").play("PageTurn")
				get_node("../../Page8/PageTurnAnim/AnimationPlayer").play("move_anim_right")
			else:
				get_node("../../Page8/PageTurnAnim").show()
				get_node("../../Page8/PageTurnAnim").play("PageTurn")
				get_node("../../Page8/PageTurnAnim/AnimationPlayer").play("move_anim_left")

func _on_animation_finished() -> void:
	hide() # Recache quand l'anim est terminée
	

func _on_page_turn_anim_2_animation_finished() -> void:
	# Recache quand l'anim 2 est terminée
	get_node("../../Page2/PageTurnAnim2").hide()
	get_node("../../Page3/PageTurnAnim2").hide()
	get_node("../../Page4/PageTurnAnim2").hide()
	get_node("../../Page5/PageTurnAnim2").hide()
	get_node("../../Page6/PageTurnAnim2").hide()
	get_node("../../Page7/PageTurnAnim2").hide()
	get_node("../../Page8/PageTurnAnim2").hide()

func _move_anim():
	page += 1
	recto = true
