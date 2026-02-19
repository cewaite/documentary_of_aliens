extends PathFollow2D

@export var speed: float = 0.01

func _physics_process(delta: float) -> void:
	loop_movement(delta)

func loop_movement(delta):
	progress_ratio += delta * speed
