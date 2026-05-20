extends Control

@export var nombre : Label

func _on_play_pressed() -> void:
	get_parent().play()

func _on_credits_pressed() -> void:
	get_parent().credits()

func _on_plus_pressed() -> void:
	get_parent().plus()

func _on_moins_pressed() -> void:
	get_parent().moins()
