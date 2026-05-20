extends Control


func _ready() -> void:
	$Accueil.show()

func play():
	$Map.show()
	$Accueil.hide()

func settings():
	pass

func credits():
	pass
