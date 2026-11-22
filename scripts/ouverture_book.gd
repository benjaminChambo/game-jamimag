extends AnimatedSprite2D

var timer = 1.5

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if timer > 0.0:
		timer -= delta
	else:
		play("anim")


func _on_animation_finished() -> void:
	hide()
