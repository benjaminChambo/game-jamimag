extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	disabled = true
	get_node("../../ToRight").corps_detecte.connect(_go_right)
	get_node("../../Reboot").reboot.connect(_reboot)
	# Replace with function body.

func _go_right():
	set_deferred("disabled", false)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _reboot():
	set_deferred("disabled", true)

func _process(_delta: float) -> void:
	pass
