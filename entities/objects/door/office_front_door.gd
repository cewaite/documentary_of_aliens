class_name OfficeFrontDoor extends Door

@export var speak_comp: SpeakComponent

func interact(interactor):
	# Check for player inventory
	if interactor.has_meta("InventoryComponent"):
		var inv_comp = interactor.get_meta("InventoryComponent") as InventoryComponent
		if inv_comp.has_item("Badge"):
			unlock()
	if locked:
		speak_comp.speak()
	if not locked:
		open()
