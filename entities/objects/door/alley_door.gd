class_name AlleyDoor extends Door

@export var speak_comp: SpeakComponent

func interact(interactor):
	if locked:
		speak_comp.speak()
	if not locked:
		open()
