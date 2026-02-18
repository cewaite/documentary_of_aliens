class_name BossDoor extends Door

@export var speak_comp: SpeakComponent

func interact():
	if locked:
		# Check for player inventory
		# If badge exists, unlock
		# Else Speak
		speak_comp.speak()
	if not locked:
		open()
