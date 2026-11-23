extends AnimatedSprite2D

var timer = 1

func _ready() -> void:
	play("book_closed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if timer > 0.0:
		timer -= delta
	else:
		play("anim_book")

func _on_animation_finished() -> void:
	hide()
