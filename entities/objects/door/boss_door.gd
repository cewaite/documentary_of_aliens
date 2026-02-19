class_name BossDoor extends Door

@export var speak_comp: SpeakComponent

func interact(interactor):
	if locked:
		# Check for world condition
		# If has_meeting, unlock
		# Else Speak
		speak_comp.speak()
	# Use another if, not else, so it can be unlocked and opened in same interact
	if not locked:
		open()
