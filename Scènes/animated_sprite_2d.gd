extends AnimatedSprite2D

var recto = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("turn_page_p"):
		if recto:
			flip_h = false
			recto = false
		else:
			flip_h = true
			recto = true
		show()
		play("PageTurn")

func _on_animation_finished() -> void:
	hide() # Replace with function body.
