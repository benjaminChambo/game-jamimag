extends Camera2D


var suivre_joueur = true
@onready var joueur = get_parent().get_node("CharacterBody2D")
@export var taille_niveau:int = 3392

func _process(_delta):
	if suivre_joueur:
		global_position = joueur.global_position
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("../Page1/ToRight").corps_detecte.connect(_go_right)
	get_node("../Page1/ToRight2").corps_detecte.connect(_go_right)

func _go_right():
	suivre_joueur = false
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "zoom", Vector2(0.2, 0.2), 2.0)
	tween.tween_property(self, "limit_right", limit_right+taille_niveau, 2.0)
	tween.finished.connect(_deuxieme_tween)

func _deuxieme_tween():
	await get_tree().create_timer(0.5).timeout
	var tween2 = create_tween()
	tween2.set_parallel(true)
	tween2.tween_property(self, "zoom", Vector2(0.3, 0.3), 2.0)
	tween2.tween_property(self, "limit_left", limit_left+taille_niveau, 2.0)
	await tween2.finished
	suivre_joueur = true
	
	
