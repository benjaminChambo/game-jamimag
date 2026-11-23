extends Node2D
var showvar = false
var onetime = true
@onready var musique = $End
@onready var noir = $CanvasLayer/ColorRect
@onready var message = $CanvasLayer/TexteFin
@onready var credits = $CanvasLayer/Crédits

var generique_lance = false

func _ready():
	hide()
	noir.color.a = 0.0
	message.modulate.a = 0.0
	credits.modulate.a = 0.0
	message.text = "Vous avez tourné la page."
	credits.text = ""
	$ZoneFin.corps_detecte.connect(_show)

func _show ():
	showvar = true

func _process(_delta):
	if Input.is_key_pressed(KEY_Y) and not generique_lance and showvar:
		generique_lance = true
		lancer_generique()
	if Input.is_key_pressed(KEY_P) and showvar :
		show()
		if onetime :
			$PageTurnSFX.play()
			onetime = false
		

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
	var textes = [
		"[center][font_size=80]Merci d'avoir joué.[/font_size][/center]",
		"[center][font_size=80]Réalisation[/font_size]\n\nJoachim\nBenjamin\nCameron\nNathan[/center]",
		"[center][font_size=80]Graphismes[/font_size]\n\nPierre\nJoachim\nAdrien\nCamille[/center]",
		"[center][font_size=80]Level designer[/font_size]\n\nBenjamin[/center]",
		"[center][font_size=80]Musique[/font_size]\n\nLoïc[/center]",
]

	for phrase in textes:
		credits.text = phrase
		credits.modulate.a = 0.0

		var tween = create_tween()
		tween.tween_property(credits, "modulate:a", 1.0, 1.0)
		await tween.finished

		await get_tree().create_timer(2.0).timeout

		var tween2 = create_tween()
		tween2.tween_property(credits, "modulate:a", 0.0, 1.0)
		await tween2.finished

		await get_tree().create_timer(0.4).timeout
