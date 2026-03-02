class_name Player extends CharacterBody2D

@export var camera: Camera2D

# Components
@export var interactComp: InteractComponent
@export var cameraAreaComp: CameraAreaComponent

# Movement
@export var max_speed: float = 500
@export var acceleration: float = 5000
@export var friction: float = 4000

# Animation
var current_animation: String = "idle0"

func _physics_process(delta):
	# Take user input
	# Movement
	var move_vector = Vector2(
				Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
				Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
			)
	move_vector = move_vector.normalized()
	# Aiming
	var aim_vector = Vector2(
				Input.get_action_strength("aim_right") - Input.get_action_strength("aim_left"), 
				Input.get_action_strength("aim_down") - Input.get_action_strength("aim_up")
			)
	
	player_movement(move_vector, delta)
	player_animation(move_vector, aim_vector)
	interact()
	take_picture()

func player_movement(move_vector, delta):
	if move_vector != Vector2.ZERO:
		# Smooth movement
		velocity += move_vector * acceleration * delta
		velocity = velocity.limit_length(max_speed)
		
	else:
		# Slow down
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()

func player_animation(move_vector, aim_vector):
	var move_angle = move_vector.angle() / (PI/4)
	var aim_angle = aim_vector.angle() / (PI/4)
	
	var angle_to_use
	var new_animation
	# If moving, use the run animation
	if move_vector != Vector2.ZERO:
		new_animation = "run"
		# Look towards aiming while running, else towards running direction
		if aim_vector != Vector2.ZERO:
			angle_to_use = aim_angle
		else:
			angle_to_use = move_angle
	# Otherwise, use idle animation, looking towards aiming or last angle if not aiming
	else:
		new_animation = "idle"
		if aim_vector != Vector2.ZERO:
			angle_to_use = aim_angle
		else:
			angle_to_use = current_animation[-1]
	
	angle_to_use = wrapi(int(angle_to_use), 0, 8)
	current_animation = new_animation + str(angle_to_use)
	$AnimatedSprite2D.play(current_animation)

func interact():
	if Input.is_action_just_pressed("interact"):
		interactComp.trigger_interact()

func take_picture():
	if Input.is_action_just_pressed("take_picture"):
		cameraAreaComp.take_picture()

func set_camera_bounds(marker: Marker2D):
	camera.limit_right = marker.global_position.x
	camera.limit_bottom = marker.global_position.y
