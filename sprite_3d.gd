extends Sprite3D

func _process(delta):
	
	# Note: put a minus sign to spin in the opposite direction
	var degrees_per_second = 1

	rotate(Vector3(0,1,0), delta * degrees_per_second)
