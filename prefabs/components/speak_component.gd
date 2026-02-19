class_name SpeakComponent extends Node

@export var dialogue: Array[String]
var curr_dialogue_line: int = 0
var finished_speaking: bool = false

func speak():
	SignalController.send_dialogue.emit(dialogue[curr_dialogue_line])
	if curr_dialogue_line < dialogue.size() - 1:
		curr_dialogue_line += 1
	elif curr_dialogue_line == dialogue.size() - 1:
		finished_speaking = true
