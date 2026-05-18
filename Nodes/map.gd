extends Node2D

var seed :int =0;
var plan = [
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,1,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0],
	[0,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
	[0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,1,1,0,0,0],
	[0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0],
	[0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0],
	[0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0],
	[0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]];

@export var player:Player;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("afficher"):
		print(get_view());
	if Input.is_action_just_pressed("rotate"):
		player.viewFront = !player.viewFront;


func get_view()->Array:
	if player.viewFront:
		return plan[player.posX];
	else:
		var x =[];
		for i in range(len(plan)):
			x.append(plan[i][player.posY]);
		return x;
