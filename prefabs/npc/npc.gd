class_name NPC extends AnimatableBody2D

@export var speak_component: SpeakComponent

func interact():
	speak_component.speak()
