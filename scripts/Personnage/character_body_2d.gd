extends CharacterBody2D

var stop = false
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("../Page1/ToRight").corps_detecte.connect(_stop)
	get_node("../Page1/ToRight2").corps_detecte.connect(_stop)
	get_node("../Page2/ToRight").corps_detecte.connect(_stop)
	get_node("../Page2/ToRight2").corps_detecte.connect(_stop)
	get_node("../Page3/ToRight").corps_detecte.connect(_stop)
	get_node("../Page3/ToRight2").corps_detecte.connect(_stop)
	get_node("../Page4/ToRight").corps_detecte.connect(_stop)
	get_node("../Page4/ToRight2").corps_detecte.connect(_stop)
func _stop():
	stop = true
	await get_tree().create_timer(4.5).timeout
	stop = false


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 500.0
const JUMP_VELOCITY = -1000.0

# Gravity - you can get it from project settings or define it here
var gravity = Vector2(0, 2000)

# Other variables you might need
#var air_jumps = 1         # For a double jump
#var current_air_jumps = 0

# Variables for "game feel" techniques (we'll initialize them later)
var coyote_timer = 0.0
const COYOTE_TIME_THRESHOLD = 0.15 # 100 milliseconds of coyote time

#var jump_buffer_timer = 0.0
#const JUMP_BUFFER_TIME_THRESHOLD = 0.1 # 100 milliseconds for jump buffer

# Constantes et variables pour le dash
const DASH_AMT: float = 1000.0
const DASH_TIME:float = 0.20

var can_dash: bool = true
var is_dashing: bool = false
var dash_dir: Vector2 = Vector2.RIGHT
var dash_timer: float = 0.0 

# Constantes et variables pour le wall jump
const WALL_GRAVITY = 7000.0
const WALL_JUMP_PUSH_FORCE = 550.0
const WALL_JUMP_VELOCITY = -700.0

var wall_coyote = 0.0
const WALL_COYOTE_TIME = 0.1

var wall_jump_lock = 0.0
const WALL_JUMP_LOCK_TIME = 0.2

var look_dir_x = 1
var direction_wall = Input.get_axis("left_q", "right_d")

# Pour anim wall jump
var wall_jump_lock_anim = 0.0
const WALL_JUMP_LOCK_ANIM_TIME = 0.2

func _physics_process(delta: float) -> void:
	if stop :
		return
	# Get the input direction and handle the movement/deceleration
	var direction = Input.get_axis("left_q", "right_d")
	
	# Flip the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			if is_dashing:
				animated_sprite.play("dash")
			else:
				animated_sprite.play("run")
	elif is_on_wall():
		animated_sprite.play("wall_slide")
	elif wall_coyote > 0.0 or wall_jump_lock_anim > 0.0:
		if Input.is_action_just_pressed("space_jump"):
			if wall_coyote > 0.0:
				wall_jump_lock_anim = WALL_JUMP_LOCK_ANIM_TIME
		elif wall_jump_lock_anim > 0.0:
			animated_sprite.play("wall_jump")
		else:
			animated_sprite.play("jump")
		wall_jump_lock_anim -= delta
	else:
		if is_dashing:
			if Vector2(Input.get_axis("left_q", "right_d"), Input.get_axis("up_z", "down_s")).normalized() == Vector2(0, -1):
				animated_sprite.play("dash_vertical")
			else:
				animated_sprite.play("dash")
		else:
			animated_sprite.play("jump")
	
	# Add the gravity.
	if !is_dashing:
		if !is_on_floor() and velocity.y > 0 and is_on_wall():
			if get_wall_normal().x > 0 and Input.is_action_pressed("left_q"):
				look_dir_x = -1
				wall_coyote = WALL_COYOTE_TIME
				velocity.y = WALL_GRAVITY * delta
			elif get_wall_normal().x < 0 and Input.is_action_pressed("right_d"):
				look_dir_x = 1
				wall_coyote = WALL_COYOTE_TIME
				velocity.y = WALL_GRAVITY * delta
			else:
				velocity += gravity * delta
				wall_coyote -= delta
		elif !is_on_floor():
			velocity += gravity * delta
			wall_coyote -= delta
		else:
			wall_coyote -= delta
		
	if is_on_floor():
		if !is_dashing and !can_dash:
			can_dash = true
		
	if !is_dashing:
		# Handle jump.
		if Input.is_action_just_pressed("space_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		if wall_jump_lock <= 0:
			if direction:
				velocity.x = direction * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_just_pressed("turn_page_p"):
		pass
		
	_dash_logic(delta)
	
	# Coyote on floor mechanic
	if is_on_floor():
		coyote_timer = COYOTE_TIME_THRESHOLD
	else:
		if coyote_timer > 0.0:
			if Input.is_action_just_pressed("space_jump"):
				velocity.y = JUMP_VELOCITY
		coyote_timer -= delta
	
	# Wall jump
	if wall_coyote > 0.0:
		if Input.is_action_just_pressed("space_jump"):
			velocity.y = WALL_JUMP_VELOCITY
			wall_jump_lock = WALL_JUMP_LOCK_TIME
	
	if wall_jump_lock > 0.0:
		wall_jump_lock -= delta
		velocity.x = -look_dir_x * WALL_JUMP_PUSH_FORCE

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
	
func bounce(force: float):
	velocity.y = force
