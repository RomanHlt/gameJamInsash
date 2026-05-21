extends CharacterBody2D
class_name Player

@export var posX:int = 1;
@export var posY:int = 1;
@export var view:int = 0; 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		if view == 0:
			if get_parent().plan[posY][posX-1] == 1:
				posX -= 1
				position.x -= 16*3
		elif view == 2:
			if get_parent().plan[posY][posX+1] == 1:
				posX += 1
				position.x -= 16*3
		elif view == 1:
			if get_parent().plan[posY+1][posX] == 1:
				posY += 1
				position.x -= 16*3
		elif view == 3:
			if get_parent().plan[posY-1][posX] == 1:
				posY -= 1
				position.x -= 16*3
	if Input.is_action_just_pressed("right"):
		if view == 0:
			if get_parent().plan[posY][posX+1] == 1:
				posX += 1
				position.x += 16*3
		elif view == 2:
			if get_parent().plan[posY][posX-1] == 1:
				posX -= 1
				position.x += 16*3
		elif view == 1:
			if get_parent().plan[posY-1][posX] == 1:
				posY -= 1
				position.x += 16*3
		elif view == 3:
			if get_parent().plan[posY+1][posX] == 1:
				posY += 1
				position.x += 16*3
