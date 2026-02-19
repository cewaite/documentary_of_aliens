class_name Door extends StaticBody2D

@export var collider: CollisionPolygon2D
@export var sprite: Sprite2D
@export var locked: bool = false

func lock():
	locked = true

func unlock():
	locked = false

func open():
	collider.set_deferred("disabled", true)
	hide()

func close():
	collider.set_deferred("disabled", false)
	show()

func interact(interactor):
	if not locked:
		open()

func _on_pass_through_detector_body_exited(body: PhysicsBody2D) -> void:
	close()
