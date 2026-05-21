extends Node2D

@export var generateur : Control
@export var n : int = 5
@export var commandes : CanvasLayer

var seed :int =0;
var plan = []

@export var player:Player;
@export var front: TileMapLayer
@export var back: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rotate_left"):
		player.view = (player.view - 1) % 4
		if player.view < 0: player.view += 4;
		print("view", player.view);
		get_view();
	if Input.is_action_just_pressed("rotate_right"):
		player.view = (player.view + 1) % 4
		if player.view < 0: player.view += 4;
		print("view", player.view);
		get_view();
	if player.posX == (len(plan) - 2) and player.posY == (len(plan) - 2):
		print("Gagné")
		get_parent().win()
		player.posX = 1
		player.posY= 1

func generate():
	plan = generateur.generate_labyrinth(n, n)
	var valide = false
	var x = 0
	var y = 0
	while not valide:
		# Pas de spawn de table de carto sur les bords (2 de marge)
		x = randi_range(2, len(plan[0]) - 3)
		y = randi_range(2, len(plan) - 3)
		if plan[x][y] == 1:
			valide = true
	$Tablecartographie.posX = x
	$Tablecartographie.posY = y

func get_view()->void:
	var front : Array[int] = []
	var back : Array[int] = []
	if player.view == 0:
		# Ligne du joueur (Front)
		for i in plan[player.posY]:
			front.append(i)
		# Ligne derrière (Back)
		if player.posY == 0:
			for i in plan[player.posY]: 
				back.append(0)
		else:
			for i in plan[player.posY-1]:
				back.append(i)

	if player.view == 1:
		# Ligne du joueur (Front)
		for ligne in plan:
			front.append(ligne[player.posX])
		# Ligne derrière (Back)
		if player.posX == 0:
			for ligne in plan:
				back.append(0)
		else:
			for ligne in plan:
				back.append(ligne[player.posX-1])
		# inverse
		for i in range(len(front)/2):
			var temp = front[-1-i]
			front[-1-i] = front[i]
			front[i] = temp
		for i in range(len(back)/2):
			var temp = back[-1-i]
			back[-1-i] = back[i]
			back[i] = temp
	
	if player.view == 2:
		# Ligne du joueur (Front)
		for i in plan[player.posY]:
			front.append(i)
		# Ligne derrière (Back)
		if player.posY == len(plan) - 1:
			for i in plan[player.posY]:
				back.append(0)
		else:
			for i in plan[player.posY+1]:
				back.append(i)
		# inverse
		for i in range(len(front)/2):
			var temp = front[-1-i]
			front[-1-i] = front[i]
			front[i] = temp
		for i in range(len(back)/2):
			var temp = back[-1-i]
			back[-1-i] = back[i]
			back[i] = temp
			
	if player.view == 3:
		# Ligne du joueur (Front)e
		for ligne in plan:
			front.append(ligne[player.posX])
		# Ligne derrière (Back)
		if player.posX == len(plan[player.posX]):
			for ligne in plan:
				back.append(0)
		else:
			for ligne in plan:
				back.append(ligne[player.posX+1])
	$Affichage.update_view([front, back])
	for ligne in plan:
		print(ligne)
