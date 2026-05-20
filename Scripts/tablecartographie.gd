extends Node2D

@export var posX : int = 0
@export var posY : int = 0
@export var timer : float = 7
@export var canvas : CanvasLayer
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
		canvas.show()
		await get_tree().create_timer(timer).timeout
		canvas.hide()
		canInteract = false
		stop = true
