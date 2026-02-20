class_name CameraAreaComponent extends Node2D

@export var parent: Player

@onready var camera_area_shape_cast: ShapeCast2D = $CameraAreaShapeCast
@onready var flash: Polygon2D = $Flash
@onready var flash_timer: Timer = $FlashTimer
@export var flash_time: float = 0.2

@onready var cooldown_timer: Timer = $CooldownTimer
@export var cooldown_time: float = 4.0

# Map for rotating collider, animation to rotation angle (degrees)
var collider_rotation_map := {
	"idle6": 0,
	"run6": 0,
	"idle7": 45,
	"run7": 45,
	"idle0": 90,
	"run0": 90,
	"idle1": 135,
	"run1": 135,
	"idle2": 180,
	"run2": 180,
	"idle3": 225,
	"run3": 225,
	"idle4": 270,
	"run4": 270,
	"idle5": 315,
	"run5": 315,
}

func _ready():
	flash.hide()
	flash_timer.wait_time = flash_time
	cooldown_timer.wait_time = cooldown_time

func _physics_process(delta: float) -> void:
	rotate_to_facing_direction(parent.current_animation)

func rotate_to_facing_direction(animation: String) -> void:
	rotation_degrees = collider_rotation_map[animation]

func take_picture():
	if cooldown_timer.time_left <= 0.0:
		show_flash()
		start_cooldown()
		capture_photo_area()

func capture_photo_area():
	camera_area_shape_cast.force_shapecast_update()
	var flash_scale = camera_area_shape_cast.get_closest_collision_unsafe_fraction()
	flash.scale = Vector2(flash_scale, flash_scale)
	var collider = camera_area_shape_cast.get_collider(0)
	if collider is PhotoArea:
		SignalController.emit_signal("complete_photo", collider)

func start_cooldown():
	cooldown_timer.wait_time = cooldown_time
	cooldown_timer.start()

func show_flash():
	flash.show()
	flash_timer.wait_time = flash_time
	flash_timer.start()

func _on_timer_timeout() -> void:
	flash_timer.stop()
	flash.hide()

func _on_cooldown_timer_timeout() -> void:
	cooldown_timer.stop()


func _on_flash_timer_timeout() -> void:
	flash_timer.stop()
	flash.hide()
