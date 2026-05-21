extends Node

@export var player : CharacterBody2D
@export var carto : Node2D

func update_view(info):
	var tile_front = select_tile(info[0])
	var tile_back = select_tile(info[1])
	var position = Vector2i(0,0)
	for i in tile_front:
		if i == 0:
			$View_front.set_cell(position, 2, Vector2i(0, 0))
		else:
			$View_front.set_cell(position, 2, Vector2i(0, 3))
		position.x += 3
	position = Vector2(0,0)
	for i in tile_back:
		if i == 0:
			$View_back.set_cell(position, 2, Vector2i(0, 0))
		else:
			$View_back.set_cell(position, 2, Vector2i(3, 0))
		position.x += 3
	
	# Partie table de cartographie
	if player.view == 0 or player.view == 2:
		if player.posY == carto.posY:
			carto.show()
			carto.position = Vector2(carto.posX * 16, 0)
	elif player.view == 1 or player.view == 3:
		if player.posX == carto.posX:
			carto.show()
			carto.position = Vector2(carto.posY * 16, 0)
	else:
		carto.hide()

func select_tile(list):
	var type_list = []
	for i in range(len(list)):
		var left = 1
		var right = 1
		if list[i] == 1: # Quand on a un trou
			type_list.append(1)
		else: # Quand on a un mur
			type_list.append(0)
			"""
			if i == 0:
				left = 0
				right = list[i+1]
			elif i == (len(list) - 1):
				right = 0
				left = list[i-1]
			else:
				left = list[i-1]
				right = list[i+1]
			if left == 1 and right == 1:
				type_list.append(1)
			if left == 0 and right == 1:
				type_list.append(2)
			if left == 1 and right == 0:
				type_list.append(3)
			if left == 0 and right == 0:
				type_list.append(4)
			"""
	return type_list
