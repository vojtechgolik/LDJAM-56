extends Node
class_name Grid

var light_pos: Vector2i
var grid_id: int = 0
var grid_pos: Vector2i = Vector2i(0, 0)
func _init(grid_id: int) -> void:
	self.grid_id = grid_id
	self.grid_pos = get_grid_pos()
	
func get_grid_pos() -> Vector2i:
	return Vector2i(self.grid_id / 3, self.grid_id % 3)
func create_lamp_position():
	var x: int = (randi() % 2) + 1
	var y: int = (randi() % 2) + 1
	self.light_pos = Vector2i(x, y)

func new_lamp() -> Lamp:
	create_lamp_position()
	var lamp: Lamp = Lamp.new(Vector2i((self.grid_pos.x * 3) + self.light_pos.x, (self.grid_pos.y * 3) + self.light_pos.y))
	return lamp
