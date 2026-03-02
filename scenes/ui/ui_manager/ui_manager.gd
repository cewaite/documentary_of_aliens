class_name UIManager extends CanvasLayer

@export var player_hud: PlayerHUD
@export var dialogue_ui: DialogueUI
@export var fade_effect: FadeEffect

func connect_hud_to_player(player):
	pass
	#if player.has_meta("InventoryComponent"):
		#var player_inv_comp = player.get_meta("InventoryComponent")
		#player_hud.player_inv_comp = player_inv_comp
		#if not player_inv_comp.equipped_wieldable_changed.is_connected(player_hud._on_wieldable_changed):
			#player_inv_comp.equipped_wieldable_changed.connect(player_hud._on_wieldable_changed)
	#
	#if player.has_meta("PlayerInteractComponent"):
		#var player_interact_comp = player.get_meta("PlayerInteractComponent")
		#if not player_interact_comp.hovering.is_connected(player_hud._on_player_interact_hovering):
			#player_interact_comp.hovering.connect(player_hud._on_player_interact_hovering)

func load_photo_descriptions(photo_areas: Array[PhotoArea]):
	player_hud.clear_photo_descriptions()
	for photo_area in photo_areas:
		player_hud.add_photo_description(photo_area.description)

func cross_off_photo(photo: PhotoArea):
	player_hud.strikethrough_photo_description(photo.description)

func fade_in():
	await fade_effect.fade(0.0).finished

func fade_out():
	await fade_effect.fade(1.0).finished
