class_name PlayerHUD extends Control

@export var photo_list_array: Array[RichTextLabel]

func add_photo_description(description: String):
	for label in photo_list_array:
		if label.text.is_empty():
			label.text = description
			break

func strikethrough_photo_description(description: String):
	for label in photo_list_array:
		if label.text == description:
			label.text = "[s]" + description + "[/s]"

func clear_photo_descriptions():
	for label in photo_list_array:
		label.text = ""
