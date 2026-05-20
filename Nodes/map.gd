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
		print(get_view())

func get_view()->Array[Array]:
	var front : Array[int] = []
	var back : Array[int] = []
	if player.view == 0:
		# Ligne du joueur (Front)
		for i in plan[player.posY]:
			front.append(i)
		# Ligne derrière (Back)
		for i in plan[player.posY-1]:
			back.append(i)

	if player.view == 1:
		# Ligne du joueur (Front)
		for ligne in plan:
			front.append(ligne[player.posX])
		# Ligne derrière (Back)
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
		# Ligne du joueur (Front)
		for ligne in plan:
			front.append(ligne[player.posX])
		# Ligne derrière (Back)
		for ligne in plan:
			back.append(ligne[player.posX+1])
	return [front, back]
