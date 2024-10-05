extends Node2D
class_name Animal

@export var animal_name: String
@export var sprite: Sprite2D

func _init(name: String, sprite: Sprite2D) -> void:
	self.animal_name = name
	self.sprite = sprite
