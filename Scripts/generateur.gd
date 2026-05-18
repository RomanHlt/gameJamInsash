extends Node

func _ready():
	pass

func generate_labyrinth(width: int, height: int) -> Array:
	# Taille réelle de la grille :
	# on espace les cellules par des murs
	var grid_width = width * 2 + 1
	var grid_height = height * 2 + 1

	# Initialisation : tout en murs
	var grid = []

	for y in range(grid_height):
		grid.append([])
		for x in range(grid_width):
			grid[y].append(1)

	var visited = []

	for y in range(height):
		visited.append([])
		for x in range(width):
			visited[y].append(false)

	# DFS depuis bas gauche
	dfs(0, height - 1, width, height, visited, grid)

	return grid


func dfs(cx: int, cy: int, width: int, height: int, visited: Array, grid: Array) -> void:
	visited[cy][cx] = true

	# Convertit coordonnées cellule -> coordonnées grille
	var gx = cx * 2 + 1
	var gy = cy * 2 + 1

	# Ouvre la cellule
	grid[gy][gx] = 0

	var directions = [
		Vector2i(1, 0),
		Vector2i(-1, 0),
		Vector2i(0, 1),
		Vector2i(0, -1)
	]

	directions.shuffle()

	for dir in directions:
		var nx = cx + dir.x
		var ny = cy + dir.y

		if nx >= 0 and nx < width and ny >= 0 and ny < height:
			if not visited[ny][nx]:

				# Coordonnées de la prochaine cellule
				var ngx = nx * 2 + 1
				var ngy = ny * 2 + 1

				# Casse le mur entre les deux cellules
				var wall_x = (gx + ngx) / 2
				var wall_y = (gy + ngy) / 2

				grid[wall_y][wall_x] = 0

				dfs(nx, ny, width, height, visited, grid)
