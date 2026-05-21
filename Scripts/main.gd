extends Control

var taille = 5

func _ready() -> void:
	$Accueil.show()
	$Accueil.nombre.text = str(taille)

func play():
	$Map.generate()
	$Map.show()
	$Accueil.hide()

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
	$Victoire.show()
	await get_tree().create_timer(5).timeout
	$Victoire.hide()
	$Accueil.show()
