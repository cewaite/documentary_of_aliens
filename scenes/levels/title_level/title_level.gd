class_name TitleCard extends Level


func _on_timer_timeout() -> void:
	exit_area.exit_level.emit()
