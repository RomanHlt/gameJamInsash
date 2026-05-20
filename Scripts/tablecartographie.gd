extends Node2D

@export var posX : int = 0
@export var posY : int = 0
@export var timer : float = 7
var canInteract = false
var stop = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if stop:
		$STOP.show()
	else:
		$"Press SPACE".show()
		canInteract = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if stop:
		$STOP.hide()
	else:
		$"Press SPACE".hide()
		canInteract = false
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and canInteract:
		# Appeler la fonction pour afficher la minimap
		await get_tree().create_timer(timer).timeout
		# Appeler la fonction pour fermer la minimap
		stop = true
		canInteract = false
