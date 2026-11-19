extends Sprite2D

func _process(delta):
	
	# Note: put a minus sign to spin in the opposite direction
	var degrees_per_second = 1.0

	rotate(delta * degrees_per_second)
