class_name InventoryComponent extends Node

@export var parent: Node2D
var inventory: Array[String] # Can be changed into a dictionary, name to Item, or Array of Item objects

func _ready() -> void:
	parent.set_meta("InventoryComponent", self)

func give_item(item: String):
	inventory.append(item)

func remove_item(item: String):
	var index = inventory.find(item)
	if index != -1:
		inventory.remove_at(index)

func has_item(item: String) -> bool:
	var index = inventory.find(item)
	return index != -1
