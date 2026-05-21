extends Node



func select_tile(list):
	var type_list = []
	for i in range(len(list)):
		var left = 1
		var right = 1
		if list[i] == 1: # QUand on a un trou
			type_list.append(0)
		else: # Quand on a un mur
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
	return type_list
