extends NPC

func interact(interactor):
	if not speak_component.finished_speaking:
		speak_component.speak()
		if speak_component.curr_dialogue_line == 4:
			#give player badge item
			if interactor.has_meta("InventoryComponent"):
				var inv_comp = interactor.get_meta("InventoryComponent") as InventoryComponent
				inv_comp.give_item("Badge")
