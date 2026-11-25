extends Area2D

class_name Globals

static var dead := false

func _on_body_entered(body: Node2D) -> void:
	dead = true
	if body.name == "CharacterBody2D":
		body.respawn()
