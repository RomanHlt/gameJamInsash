extends TileMapLayer

#@export var map:Node2D;

const Tile_Wall = Vector2i(0,0)
const Tile_Floor = Vector2i(1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var map = get_parent().get_parent()
	var carte = map.plan

	for y in carte.size():
		for x in carte[y].size():
			var cell = Vector2i(x,y)
			if carte[x][y] == 0:
				set_cell(cell, 0, Tile_Wall)
			else:
				set_cell(cell, 0, Tile_Floor)
	print("ça marche?")
