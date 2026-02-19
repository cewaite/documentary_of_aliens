class_name WeirdoNPC extends NPC

@export var food: WeirdosFood
@export var variant_speak_comp: SpeakComponent

func interact(interactor):
	if food.is_poisoned:
		variant_speak_comp.speak()
	else:
		speak_component.speak()

func is_poisioned() -> bool:
	return variant_speak_comp.finished_speaking
