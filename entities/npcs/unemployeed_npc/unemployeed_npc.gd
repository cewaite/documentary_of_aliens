extends NPC

func interact():
	if not speak_component.finished_speaking:
		speak_component.speak()
