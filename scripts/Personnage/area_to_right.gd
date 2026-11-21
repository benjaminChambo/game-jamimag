extends Area2D

signal corps_detecte

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		corps_detecte.emit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
