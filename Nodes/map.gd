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
@export var tile_map_layer: TileMapLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("afficher"):
		print(get_view());
	if Input.is_action_just_pressed("rotate"):
		player.viewFront = !player.viewFront;
		print(get_view());

func get_view()->Array:
	if player.viewFront:
		var x:int=0
		for i in plan[player.posY]:
			print(player.viewFront,x);
			if i == 0:
				tile_map_layer.set_cell(Vector2i(x,0), 1, Vector2i(1,1), 0);
			elif i==1:
				tile_map_layer.set_cell(Vector2i(x,0), 1, Vector2i(10,1), 0);
			x+=1;

		return plan[player.posY];
	else:
		var a =[];
		for i in range(len(plan)):
			print(player.viewFront,i);
			if plan[i][player.posX] == 0:
				tile_map_layer.set_cell(Vector2i(i,0), 1, Vector2i(1,1), 0);
			elif plan[i][player.posX] == 1:
				tile_map_layer.set_cell(Vector2i(i,0), 1, Vector2i(10,1), 0);
			a.append(plan[i][player.posX]);
		return a;
