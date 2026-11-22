extends AnimatedSprite2D

var recto = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()  # Cache l'anim au début
	get_node("../Page1/ToRight").corps_detecte.connect(_move_anim)
	get_node("../Page1/ToRight2").corps_detecte.connect(_move_anim)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("turn_page_p"):
		if recto:
			flip_h = false
			recto = false
		else:
			flip_h = true
			recto = true
		show() # Fais apparaître l'anim
		play("PageTurn")
		if !recto:
			$AnimationPlayer.play("move_anim_right")
		else:
			$AnimationPlayer.play("move_anim_left")

func _on_animation_finished() -> void:
	hide() # Recache quand l'anim est terminée
	
func _move_anim():
	offset.x += 3392
	recto = true
