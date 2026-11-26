extends Node2D

func _process(_delta) -> void:
	pass
#
#@export var musique_2: AudioStream
#@export var musique_1: AudioStream
#
#@export var niveau_changement_musique = 5
#@export var niveau_arret_musique = 10
#
#@export var duree_fondu = 3.0
#@export var duree_premier_fondu = 10.0
#
#@onready var niveau = $CharacterBody2D.page
#
#var musique_actuelle = 0
#
#func _ready():
	#$Page1/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page1/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page2/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page2/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page3/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page3/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page4/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page4/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page5/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page5/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page6/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page6/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page7/ToRight.corps_detecte.connect(_gerer_musique)
	#$Page7/ToRight2.corps_detecte.connect(_gerer_musique)
	#$Page8/ToRight.corps_detecte.connect(_gerer_musique)
	#_gerer_musique()
#
#
#func _gerer_musique():
#
	## On récupère le niveau actuel du personnage
	#niveau = $CharacterBody2D.page
#
	#var musique_voulue = 0
#
	#if niveau >= niveau_arret_musique:
		#musique_voulue = 0
#
	#elif niveau >= niveau_changement_musique:
		#musique_voulue = 2
#
	#else:
		#musique_voulue = 1
#
	#if musique_voulue == musique_actuelle:
		#return
#
	#musique_actuelle = musique_voulue
#
	#var tween = create_tween()
	#tween.set_parallel(true)
#
	#if musique_voulue == 0:
		#tween.tween_property($Musique1, "volume_db", -80, duree_fondu)
		#tween.tween_property($Musique2, "volume_db", -80, duree_fondu)
#
	#else:
		#var lecteur = $Musique1 if musique_voulue == 1 else $Musique2
		#var autre = $Musique2 if musique_voulue == 1 else $Musique1
		#
#
		#lecteur.stream = musique_1 if musique_voulue == 1 else musique_2
		#print(lecteur.stream.get_class())
		#lecteur.volume_db = -80
		#lecteur.play()
#
		#var duree = duree_premier_fondu if musique_actuelle == 1 and niveau < niveau_changement_musique else duree_fondu
#
		#tween.tween_property(autre, "volume_db", -40, duree)
		#tween.tween_property(lecteur, "volume_db", 0, duree)
#
	#await tween.finished
#
	#if musique_voulue == 0:
		#$Musique1.stop()
		#$Musique2.stop()
	#else:
		#var autre = $Musique2 if musique_voulue == 1 else $Musique1
		#autre.stop()
