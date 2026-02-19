extends NPC

func interact():
	if not speak_component.finished_speaking:
		speak_component.speak()
		if speak_component.curr_dialogue_line == 4:
			pass
			#give player badge item
