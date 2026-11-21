extends Area2D
signal reboot
func _ready():
	body_entered.connect(_reboot)
func _reboot(body):
	if body.name == "CharacterBody2D":
		reboot.emit()
