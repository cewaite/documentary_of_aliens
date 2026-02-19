class_name WeirdosFood extends StaticBody2D

@export var speak_comp: SpeakComponent
@export var var_speak_comp: SpeakComponent
var is_poisoned: bool = false

func interact(interactor):
	if interactor.has_meta("InventoryComponent"):
		var inv = interactor.get_meta("InventoryComponent") as InventoryComponent
		if inv.has_item("Poison"):
			speak_comp.speak()
			is_poisoned = true
	if not is_poisoned:
		var_speak_comp.speak()
