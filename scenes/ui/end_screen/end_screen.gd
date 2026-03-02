class_name EndScreen extends CanvasLayer

@export var photos_taken_text: RichTextLabel

func set_photos_taken(taken: int):
	photos_taken_text.text = "PHOTO's TAKEN: " + str(taken)
