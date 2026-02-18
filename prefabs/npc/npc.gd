class_name NPC extends AnimatableBody2D

@onready var speak_component: SpeakComponent = $SpeakComponent

func interact():
	speak_component.speak()
