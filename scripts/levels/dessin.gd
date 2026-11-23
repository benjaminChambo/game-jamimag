extends Node2D

var show = false

var tige_faite = false
var petales_faits = false
var animation_en_cours = false

var progression = 0.0
var courbes_bleues = []
var courbes_rouges = []

var bleues_terminees = 0
var rouges_terminees = 0


func _ready():
	scale = Vector2(4,4)
	get_node("../ZoneFin").corps_detecte.connect(_show)
	creer_tracés()

func _show():
	show = true

func creer_tracés():

	# =========================
# TIGE BLEUE
# =========================
	courbes_bleues.append([
	Vector2(0, 150),
	Vector2(-18, 110),
	Vector2(12, 55),
	Vector2(0, 0)
])

# =========================
# PISTIL CENTRAL
# =========================
	courbes_bleues.append([
	Vector2(3, 20),
	Vector2(-4, 0),
	Vector2(-2, -22),
	Vector2(0, -33)
])

# =========================
# FILAMENT GAUCHE
# =========================
	courbes_bleues.append([
	Vector2(-2, -7),
	Vector2(-12, -17),
	Vector2(-24, -25),
	Vector2(-29, -29)
])

# =========================
# FILAMENT DROIT
# =========================
	courbes_bleues.append([
	Vector2(2, -10),
	Vector2(14, -20),
	Vector2(24, -26),
	Vector2(31, -32)
])
# =========================
# PETALE CENTRAL
# =========================
	courbes_rouges.append([
	Vector2(0, -30),
	Vector2(-30, -60),
	Vector2(-25, -115),
	Vector2(0, -130)
	])
	courbes_rouges.append([
	Vector2(0, -130),
	Vector2(25, -115),
	Vector2(30, -60),
	Vector2(0, -30)
	])

# =========================
# PETALE HAUT GAUCHE
# =========================
	courbes_rouges.append([
	Vector2(0, -30),
	Vector2(-35, -55),
	Vector2(-80, -95),
	Vector2(-100, -75)
])
	courbes_rouges.append([
	Vector2(-100, -75),
	Vector2(-105, -45),
	Vector2(-40, -35),
	Vector2(0, -30)
])

# =========================
# PETALE HAUT DROIT
# =========================
	courbes_rouges.append([
	Vector2(0, -30),
	Vector2(35, -55),
	Vector2(80, -95),
	Vector2(100, -75)
])
	courbes_rouges.append([
	Vector2(100, -75),
	Vector2(105, -45),
	Vector2(40, -35),
	Vector2(0, -30)
])

# =========================
# PETALE GAUCHE
# =========================
	courbes_rouges.append([
	Vector2(0, -30),
	Vector2(-45, -35),
	Vector2(-85, -60),
	Vector2(-85, -40)
])
	courbes_rouges.append([
	Vector2(-85, -40),
	Vector2(-75, -15),
	Vector2(-30, -18),
	Vector2(0, -30)
])

# =========================
# PETALE DROIT
# =========================
	courbes_rouges.append([
	Vector2(0, -30),
	Vector2(45, -35),
	Vector2(85, -60),
	Vector2(85, -40)
])
	courbes_rouges.append([
	Vector2(85, -40),
	Vector2(75, -15),
	Vector2(30, -18),
	Vector2(0, -30)
])


func _process(_delta):

	if Input.is_action_just_pressed("left_q") and not animation_en_cours and not tige_faite:
		dessiner_bleu()

	if Input.is_key_pressed(KEY_Y) and tige_faite and not animation_en_cours and not petales_faits and show:
		dessiner_rouge()

	queue_redraw()


func dessiner_bleu():
	animation_en_cours = true

	for i in range(courbes_bleues.size()):
		progression = 0.0

		var tween = create_tween()
		tween.tween_property(self, "progression", 1.0, 0.45)
		await tween.finished

		bleues_terminees += 1

	tige_faite = true
	animation_en_cours = false
	queue_redraw()


func dessiner_rouge():
	animation_en_cours = true

	for i in range(courbes_rouges.size()):
		progression = 0.0

		var tween = create_tween()
		tween.tween_property(self, "progression", 1.0, 0.30)
		await tween.finished

		rouges_terminees += 1

	petales_faits = true
	animation_en_cours = false
	queue_redraw()


func courbe_bezier(points, t):
	var p0 = points[0]
	var p1 = points[1]
	var p2 = points[2]
	var p3 = points[3]

	return (
		p0 * pow(1.0 - t, 3)
		+ p1 * 3.0 * pow(1.0 - t, 2) * t
		+ p2 * 3.0 * (1.0 - t) * pow(t, 2)
		+ p3 * pow(t, 3)
	)


func points_courbe(points, limite = 1.0):
	var resultat = PackedVector2Array()

	for i in range(21):
		var t = float(i) / 20.0

		if t > limite:
			break

		resultat.append(courbe_bezier(points, t))

	return resultat


func _draw():

	# Dessiner les courbes bleues déjà terminées
	for i in range(bleues_terminees):
		draw_polyline(
			points_courbe(courbes_bleues[i]),
			Color.DODGER_BLUE,
			10.0,
			true
		)

	# Dessiner la courbe bleue en cours
	if animation_en_cours and not tige_faite:
		if bleues_terminees < courbes_bleues.size():
			draw_polyline(
				points_courbe(
					courbes_bleues[bleues_terminees],
					progression
				),
				Color.DODGER_BLUE,
				10.0,
				true
			)

	# Dessiner les courbes rouges terminées
	for i in range(rouges_terminees):
		draw_polyline(
			points_courbe(courbes_rouges[i]),
			Color.RED,
			10,
			true
		)

	# Dessiner le pétale en cours
	if animation_en_cours and tige_faite:
		if rouges_terminees < courbes_rouges.size():
			draw_polyline(
				points_courbe(
					courbes_rouges[rouges_terminees],
					progression
				),
				Color.RED,
				10,
				true
			)
