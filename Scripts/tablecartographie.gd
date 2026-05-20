extends Node2D

@export var posX : int = 0
@export var posY : int = 0
@export var timer : float = 7
var canInteract : bool = false
var stop : bool = false



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_class("Player"):
		if stop:
			$Stop.show()
		else:
			$Interact.show()
			canInteract = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_class("Player"):
		if stop:
			$Stop.hide()
		else:
			$Interact.hide()
			canInteract = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact") and canInteract:
		# ouvrir minimap
		await get_tree().create_timer(timer).timeout
		# fermer la minimap
		canInteract = false
		stop = true
