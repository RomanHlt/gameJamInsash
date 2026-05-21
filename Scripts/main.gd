extends Control

var taille = 5

func _ready() -> void:
	$Accueil.show()
	$Accueil.nombre.text = str(taille)

func play():
	$Map.generate()
	$Map.show()
	$Map.commandes.show()
	$Accueil.hide()
	$Timer.show()
	$Timer/TIME.start()

func credits():
	$Credits.show()
	$Accueil.hide()
	await get_tree().create_timer(5).timeout
	$Credits.hide()
	$Accueil.show()

func moins():
	if taille > 4:
		taille -= 1
		$Map.n = taille
		$Accueil.nombre.text = str(taille)

func plus():
	if taille < 10:
		taille += 1
		$Map.n = taille
		$Accueil.nombre.text = str(taille)
		
func win():
	$Map.hide()
	$Map.commandes.hide()
	$Victoire.show()
	$Timer/TIME.stop()
	await get_tree().create_timer(5).timeout
	$Timer/TIME.hide()
	$Victoire.hide()
	$Accueil.show()
