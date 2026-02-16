class_name InteractComponent extends Area2D

@export var parent: Player # Consider making it agnostic, Person (for NPC or Player)

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

func trigger_interact() -> void:
	var areas = get_overlapping_areas()
	print_debug("Overlapping areas: ", areas)
	for area in areas:
		if area is InteractableComponent:
			print_debug("Interacting with: ", area.name)
			area.call_parent_interact()

func rotate_to_facing_direction(animation: String) -> void:
	rotation_degrees = collider_rotation_map[animation]

func _on_area_entered(area: Area2D) -> void:
	if area is InteractableComponent:
		var interactableComp: InteractableComponent = area
		interactableComp.enable_icon()

func _on_area_exited(area: Area2D) -> void:
	if area is InteractableComponent:
		var interactableComp: InteractableComponent = area
		interactableComp.disable_icon()
