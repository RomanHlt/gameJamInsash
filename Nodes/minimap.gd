extends TileMapLayer

@export var map: Node2D;

const Tile_Wall = Vector2i(0,0)
const Tile_Floor = Vector2i(1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var carte = map.plan

	for ligne in range (len(carte)):
		for colonne in range (len(carte[ligne])):
			var cell = Vector2i(colonne,ligne)
			if carte[ligne][colonne] == 0:
				set_cell(cell, 2, Tile_Wall)
			else:
				set_cell(cell, 2, Tile_Floor)	
