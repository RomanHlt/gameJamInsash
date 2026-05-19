extends Node2D

var seed :int =0;
var plan = [
	[0,1,1],
	[1,1,0],
	[1,0,0]
	]

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

func get_view()->void:
	if player.view == 0:
		var x:int = 0 # Décalage en x au niveau de l'affichage
		# Ligne du joueur (Front)
		for i in plan[player.posY]:
			if i == 0: # Vide
				front.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif i == 1: # Mur
				front.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x+=1;
		x = 0
		# Ligne derrière (Back)
		for i in plan[player.posY-1]:
			if i == 0: # Vide
				back.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif i == 1: # Mur
				back.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x+=1;

	if player.view == 1:
		var x:int = len(plan) - 1 # Décalage en x au niveau de l'affichage (Commence à la fin et va vers le debut pour la vue de derrière le laby)
		# Ligne du joueur (Front)
		for ligne in plan:
			if ligne[player.posX] == 0: # Vide
				front.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif ligne[player.posX] == 1: # Mur
				front.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x-=1;
		x = len(plan) - 1
		# Ligne derrière (Back)
		for ligne in plan:
			if ligne[player.posX+1] == 0: # Vide
				back.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif ligne[player.posX-1] == 1: # Mur
				back.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x-=1;
	
	if player.view == 2:
		var x:int = len(plan[player.posY]) - 1 # Décalage en x au niveau de l'affichage (Commence à la fin et va vers le debut pour la vue de derrière le laby)
		# Ligne du joueur (Front)
		for i in plan[player.posY]:
			if i == 0: # Vide
				front.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif i == 1: # Mur
				front.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x-=1;
		x = len(plan[player.posY+1])
		# Ligne derrière (Back)
		for i in plan[player.posY+1]:
			if i == 0: # Vide
				back.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif i == 1: # Mur
				back.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x-=1;
	
	if player.view == 3:
		var x:int = 0 # Décalage en x au niveau de l'affichage
		# Ligne du joueur (Front)
		for ligne in plan:
			if ligne[player.posX] == 0: # Vide
				front.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif ligne[player.posX] == 1: # Mur
				front.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x+=1;
		x = 0
		# Ligne derrière (Back)
		for ligne in plan:
			if ligne[player.posX+1] == 0: # Vide
				back.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif ligne[player.posX+1] == 1: # Mur
				back.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x+=1;
