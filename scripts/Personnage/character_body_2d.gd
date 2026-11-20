extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -700.0

# Gravity - you can get it from project settings or define it here
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Other variables you might need
#var air_jumps = 1         # For a double jump
#var current_air_jumps = 0

# Variables for "game feel" techniques (we'll initialize them later)
#var coyote_timer = 0.0
#const COYOTE_TIME_THRESHOLD = 0.1 # 100 milliseconds of coyote time

#var jump_buffer_timer = 0.0
#const JUMP_BUFFER_TIME_THRESHOLD = 0.1 # 100 milliseconds for jump buffer
#

# Constantes et variables pour le dash
const DASH_AMT: float = 700.0
const DASH_TIME:float = 0.20

var can_dash: bool = true
var is_dashing: bool = false
var dash_dir: Vector2 = Vector2.RIGHT
var dash_timer: float = 0.0 

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if !is_dashing:
		if not is_on_floor():
			velocity += get_gravity() * delta
		
	if is_on_floor():
		if !is_dashing and !can_dash:
			can_dash = true
		
	if !is_dashing:
		# Handle jump.
		if Input.is_action_just_pressed("space_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("left_q", "right_d")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("turn_page_p"):
		pass
		
	_dash_logic(delta)

func _dash_logic(delta: float) -> void:

	var input_dir: Vector2 = Vector2(
		Input.get_axis("left_q", "right_d"),
		Input.get_axis("up_z", "down_s")
	).normalized()

	if input_dir.x != 0:
		dash_dir.x = input_dir.x

	if can_dash and Input.is_action_just_pressed("dash_o"):
		var final_dash_dir: Vector2 = dash_dir
		if input_dir.y != 0 and input_dir.x == 0:
			final_dash_dir.x = 0
		final_dash_dir.y = input_dir.y

		can_dash = false
		is_dashing = true
		dash_timer = DASH_TIME

		velocity = final_dash_dir * DASH_AMT

	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0.0:
			is_dashing = false

	move_and_slide()
	
	
