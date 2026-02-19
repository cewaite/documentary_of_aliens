extends StaticBody2D

@export var speak_comp: SpeakComponent

func interact(interactor):
	speak_comp.speak()
	if interactor is Player:
		if interactor.has_meta("InventoryComponent"):
			var inv_comp = interactor.get_meta("InventoryComponent") as InventoryComponent
			inv_comp.give_item("Poison")
