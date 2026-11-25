extends Sprite2D
var stop = false

func _ready():
	get_node("../../Page1/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page1/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page2/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page2/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page3/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page3/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page4/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page4/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page5/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page5/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page6/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page6/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page7/ToRight").corps_detecte.connect(_stop)
	get_node("../../Page7/ToRight2").corps_detecte.connect(_stop)
	get_node("../../Page8/ToRight").corps_detecte.connect(_stop)
	
func _stop():
	stop = true
	await get_tree().create_timer(3.5).timeout
	stop = false

func _process(_delta):
	if Input.is_action_just_pressed("turn_page_p") and !stop:
		if visible == true :
			visible = false
		else :
			visible = true
