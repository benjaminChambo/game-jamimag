extends CanvasLayer

@onready var fond = $Fond
@onready var texte = $Texte

var textes = [
	"Il y a bien longtemps...",
	"Un monde oublié de tous...",
	"Une histoire sur le point de commencer."
]

func _ready():
	jouer_intro()


func jouer_intro():
	for phrase in textes:
		texte.text = phrase

		# Le texte commence invisible
		texte.modulate.a = 0.0

		# Apparition du texte
		var tween = create_tween()
		tween.tween_property(texte, "modulate:a", 1.0, 1.0)
		await tween.finished

		# On laisse le texte affiché
		await get_tree().create_timer(2.0).timeout

		# Disparition du texte
		var tween2 = create_tween()
		tween2.tween_property(texte, "modulate:a", 0.0, 1.0)
		await tween2.finished

		# Petite pause avant la phrase suivante
		await get_tree().create_timer(0.4).timeout

	# Une fois tous les textes terminés,
	# on fait disparaître le fond noir
	var tween3 = create_tween()
	tween3.tween_property(fond, "color:a", 0.0, 2.0)
	await tween3.finished

	# L'intro est terminée
	queue_free()
