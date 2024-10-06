extends Sprite2D
class_name Animal

var id: int
const sprite_set = preload("res://img/animal_tilemap.png")
var grid_position: Vector2i
func _init(parent: Node, id: int, position: Vector2i) -> void:
	self.id = id
	self.texture = sprite_set
	
	#Enable sprite selection of region
	self.region_enabled = true
	self.region_rect = get_animal_sprite()
	self.grid_position = position
	self.position = Vector2(position.x*66+33, position.y*66+33)
	
	parent.add_child(self)
	
func get_animal_sprite():
	return Rect2(id*66, 0, 66, 66)
		
