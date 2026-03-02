extends StaticBody2D

@export var speak_comp: SpeakComponent

func interact(interactor):
	speak_comp.speak()
