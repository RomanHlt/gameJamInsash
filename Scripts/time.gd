extends Label


@export var timer:float
@export var chronoOn:bool = false

func _process(delta : float):
	timer += delta
	#temps en secondes, avec 3 décimales
	self.text = String.num(timer, 3) 
	text = str(snappedf(timer,0.01))

func start():
	reset()
	chronoOn = true

func stop():
	chronoOn = false

func reset():
	timer = 0.0
