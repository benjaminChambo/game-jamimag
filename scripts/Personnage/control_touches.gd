
extends Node2D

func _ready():
	modulate.a = 0.0

	# Apparition
	var apparition = create_tween()
	apparition.tween_property(self, "modulate:a", 0.9, 1.0)
	await apparition.finished

	# Clignotement doux
	var clignotement = create_tween()
	clignotement.set_loops(4)

	clignotement.tween_property(self, "modulate:a", 0.2, 1)
	clignotement.tween_property(self, "modulate:a", 0.9, 1)

	await clignotement.finished
	
	# Disparition
	var disparition = create_tween()
	disparition.tween_property(self, "modulate:a", 0.0, 1.5)

	await disparition.finished
	queue_free()
