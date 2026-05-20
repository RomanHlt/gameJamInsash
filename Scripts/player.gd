extends Node2D
class_name Player

@export var posX:int = 0;
@export var posY:int = 0;
@export var viewFront:bool = true; 
@export var wallSize:int = 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	estimate_pos()

func estimate_pos() -> void:
	posX = int(position.x/wallSize)
