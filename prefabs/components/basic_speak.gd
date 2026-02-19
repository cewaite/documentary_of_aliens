class_name BasicSpeak extends StaticBody2D

@export var speak_comp: SpeakComponent

func interact():
	speak_comp.speak()
