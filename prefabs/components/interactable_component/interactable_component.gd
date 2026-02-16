class_name InteractableComponent extends Area2D

@export var parent: Node2D
@export var interact_icon: Sprite2D

func _ready() -> void:
	interact_icon.hide()
	parent.set_meta("InteractableComponent", self)
	assert(parent.has_method("interact"), "Object has an InteractableComponent but no interact method: " + parent.name)
	assert(interact_icon != null, "Object has no interact_icon: " + parent.name)

func call_parent_interact():
	print_debug("Interacting with: ", parent.name)
	parent.interact()

func enable_icon():
	interact_icon.show()

func disable_icon():
	interact_icon.hide()
