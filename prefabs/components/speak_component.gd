class_name SpeakComponent extends Node

@export var dialogue: Array[String]
@export var stop_on_finished: bool = false
@export var restart_on_finished: bool = true
var curr_dialogue_line: int = 0
var finished_speaking: bool = false

func speak():
	if not (finished_speaking and stop_on_finished):
		SignalController.send_dialogue.emit(dialogue[curr_dialogue_line])
		if curr_dialogue_line < dialogue.size() - 1:
			curr_dialogue_line += 1
		elif not finished_speaking:
			if restart_on_finished:
				curr_dialogue_line = 0
			else:
				finished_speaking = true
