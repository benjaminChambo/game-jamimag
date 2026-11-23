
extends Node2D

@export var page_cible: int = 2

@onready var label = $Label

var deja_affiche = false

func _ready():
	modulate.a = 0.0

func _process(_delta):
	var joueur = get_parent()

	if joueur.page == page_cible and not deja_affiche:
		deja_affiche = true
		afficher_tuto()

func afficher_tuto():
	var apparition = create_tween()
	apparition.tween_property(self, "modulate:a", 0.8, 1.0)
	await apparition.finished

	var clignotement = create_tween()
	clignotement.set_loops(4)

	clignotement.tween_property(self, "modulate:a", 0.4, 0.5)
	clignotement.tween_property(self, "modulate:a", 0.8, 0.5)

	await clignotement.finished

	var disparition = create_tween()
	disparition.tween_property(self, "modulate:a", 0.0, 1.5)
