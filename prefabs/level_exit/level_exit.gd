class_name LevelExit extends Node2D

signal exit_level

func interact(interactor):
	exit_level.emit()
