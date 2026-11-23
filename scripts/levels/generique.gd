extends Node2D

@onready var musique = $End
@onready var noir = $CanvasLayer/ColorRect
@onready var message = $CanvasLayer/TexteFin
@onready var credits = $CanvasLayer/Crédits

var generique_lance = false

func _ready():
	noir.color.a = 0.0
	message.modulate.a = 0.0
	credits.modulate.a = 0.0
	message.text = "Vous avez tourné la page."
	credits.text = ""

func _process(_delta):
	if Input.is_key_pressed(KEY_Y) and not generique_lance:
		generique_lance = true
		lancer_generique()

func lancer_generique():
	# La musique démarre doucement
	musique.volume_db = -40
	musique.play()
	
	var tween_musique = create_tween()
	tween_musique.tween_property(musique, "volume_db", 0.0, 5.0)

	# Le jeu disparaît progressivement dans le noir
	await get_tree().create_timer(3.0).timeout

	var tween_noir = create_tween()
	tween_noir.tween_property(noir, "color:a", 1.0, 2.5)
	await tween_noir.finished

	# Apparition du message final
	var tween_message = create_tween()
	tween_message.tween_property(message, "modulate:a", 1.0, 2.0)
	await tween_message.finished

	await get_tree().create_timer(3.0).timeout

	# Le message disparaît
	var tween_disparition = create_tween()
	tween_disparition.tween_property(message, "modulate:a", 0.0, 2.0)
	await tween_disparition.finished

	# Apparition des crédits
	credits.text = "Création et réalisation\n\n[Insère ton nom]\n\nMerci d'avoir joué."

	var tween_credits = create_tween()
	tween_credits.tween_property(credits, "modulate:a", 1.0, 3.0)
