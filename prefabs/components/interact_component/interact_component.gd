class_name InteractComponent extends Area2D

@export var parent: Player # Consider making it agnostic, Person (for NPC or Player)
var curr_interacting_with: InteractableComponent

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

func _physics_process(delta: float) -> void:
	rotate_to_facing_direction(parent.current_animation)
	update_curr_interacting_with()

func rotate_to_facing_direction(animation: String) -> void:
	rotation_degrees = collider_rotation_map[animation]

func trigger_interact() -> void:
	if curr_interacting_with:
		curr_interacting_with.call_parent_interact(parent)

func update_curr_interacting_with():
	var areas: Array[Area2D] = get_overlapping_areas()
	
	if curr_interacting_with != null and not areas.has(curr_interacting_with):
		curr_interacting_with.disable_icon()
		curr_interacting_with = null

	if curr_interacting_with == null and not areas.is_empty():
		curr_interacting_with = areas.get(0)
		curr_interacting_with.enable_icon()
	
