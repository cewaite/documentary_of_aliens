class_name JoshNPC extends NPC

signal unlock_boss_door()

@export var weirdo: WeirdoNPC
@export var variant_speak_comp: SpeakComponent

func interact(interactor):
	if not weirdo.is_poisioned():
		speak_component.speak()
	else:
		variant_speak_comp.speak()
		unlock_boss_door.emit()
