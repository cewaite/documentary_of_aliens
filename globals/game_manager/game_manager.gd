class_name GameManager extends Node

@export var ui_manager: UIManager
@export var levels: Array[PackedScene]
var curr_level_scene: PackedScene
var curr_level: Level

func _ready() -> void:
	# Load first level
	curr_level_scene = levels.pop_front()
	curr_level = curr_level_scene.instantiate()
	add_child(curr_level)
	# Load UI 
	# Add photo descriptions into PlayerUI
	ui_manager.load_photo_descriptions(curr_level.photo_areas)
	# Connect Signals
	SignalController.complete_photo.connect(complete_photo)

func complete_photo(photo: PhotoArea):
	photo.completed = true
	ui_manager.cross_off_photo(photo)
