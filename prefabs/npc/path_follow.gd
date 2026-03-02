extends PathFollow2D

@export var speed: float = 0.01
@export var npc_sprite: AnimatedSprite2D

var prev_x_val: float

func _ready() -> void:
	assert(npc_sprite != null)
	prev_x_val = global_position.x

func _physics_process(delta: float) -> void:
	loop_movement(delta)
	flip_sprite(delta)

func loop_movement(delta):
	progress_ratio += delta * speed

func flip_sprite(delta):
	if prev_x_val - global_position.x >= 0:
		npc_sprite.flip_h = true
	else:
		npc_sprite.flip_h = false
	prev_x_val = global_position.x
