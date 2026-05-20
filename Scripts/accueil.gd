extends Control

func _on_play_pressed() -> void:
	get_parent().play()

func _on_settings_pressed() -> void:
	get_parent().settings()

func _on_credits_pressed() -> void:
	get_parent().credits()
