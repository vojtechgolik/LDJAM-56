extends Node2D
class_name Lamp
const lamp = preload("res://scenes/lamp.tscn")
@onready var creatures_map: TileMapLayer = $layer_holder/game_board/creatures_map

const TEXTURE_SIZE: int = 66

var lamp_loc = Vector2i(0, 0)

func _init(location: Vector2i) -> void:
	self.lamp_loc = location

func render_lamp(parent: Node) -> void:
	var lamp_obj = lamp.instantiate()
	lamp_obj.set_position(Vector2(self.lamp_loc.x * TEXTURE_SIZE, self.lamp_loc.y * TEXTURE_SIZE))
	parent.add_child(lamp_obj)
	
	
	
