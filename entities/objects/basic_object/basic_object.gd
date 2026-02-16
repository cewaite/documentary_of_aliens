class_name BasicObject extends RigidBody2D

@onready var speak_component: SpeakComponent = $SpeakComponent

func interact():
	speak_component.speak()
