class_name Janitor extends NPC

func _on_interact_component_area_entered(area: Area2D) -> void:
	if area is InteractableComponent:
		if area.parent is Door:
			var door = area.parent as Door
			door.open()


func _on_interact_component_area_exited(area: Area2D) -> void:
	if area is InteractableComponent:
		if area.parent is Door:
			var door = area.parent
			door.close()
