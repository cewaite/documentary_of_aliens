class_name NPC extends StaticBody2D

@export var speak_component: SpeakComponent

func interact(interactor):
	speak_component.speak()
