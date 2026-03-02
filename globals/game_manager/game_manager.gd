class_name GameManager extends Node

@export var ui_manager: UIManager
@export var levels: Array[PackedScene]
var curr_level_scene: PackedScene
var curr_level: Level
var curr_level_index: int = 0
var num_photos: int = 0

const END_SCREEN = preload("uid://dunmsh3nol37f")


func _ready() -> void:
	await load_level()

func load_level():
	await ui_manager.fade_out()
	if curr_level:
		curr_level_index += 1
		curr_level.queue_free()
	if not levels.is_empty():
		curr_level_scene = levels.pop_front()
		curr_level = curr_level_scene.instantiate()
		add_child(curr_level)
		load_ui()
		connect_signals()
	else:
		var end_screen = END_SCREEN.instantiate() as EndScreen
		end_screen.set_photos_taken(num_photos)
		add_child(end_screen)
	await ui_manager.fade_in()

func load_ui():
	# Add photo descriptions into PlayerUI
	ui_manager.load_photo_descriptions(curr_level.photo_areas)

func connect_signals():
	SignalController.complete_photo.connect(complete_photo)
	curr_level.exit_area.exit_level.connect(load_level)

func complete_photo(photo: PhotoArea):
	num_photos += 1
	photo.completed = true
	ui_manager.cross_off_photo(photo)
