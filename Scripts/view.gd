extends Node2D

@export var map:Node2D
@export var front:TileMapLayer
@export var back:TileMapLayer

var motif:Array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(5):
		motif.append(front.tile_set.get_pattern(i))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _update_view(info:Array):
	var target_position = Vector2i(0, 0) # Top-left position for the pattern
	for i in info[0]:
		if i==0:
			front.set_pattern(target_position, motif[0])
		else:
			front.set_pattern(target_position,motif[4])
		target_position.x += 3*16;
	target_position = Vector2i(0, 0) # Top-left position for the pattern
	for i in info[1]:
		if i==0:
			back.set_pattern(target_position, motif[0])
		else:
			back.set_pattern(target_position,motif[4])
		target_position.x += 3*16;
	front.update_internals()   
