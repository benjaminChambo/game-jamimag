extends Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("joueur"):
		if body.global_position.y < global_position.y:
			body.bounce(-1500)
			animated_sprite_2d.play("jump")

func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "jump":
		animated_sprite_2d.animation = "idle"
