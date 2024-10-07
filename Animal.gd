extends Sprite2D
class_name Animal

var id: int
const sprite_set = preload("res://img/animal_tilemap.png")

const GAME_BOARD_SIZE = 9
const OVERLAY_SOURCE_ID = 0

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
func draw_overlay(overlay: TileMapLayer, current: Vector2i, lamp_positions: Array):
	#Blacked board
	for i in range(GAME_BOARD_SIZE):
		for j in range(GAME_BOARD_SIZE):
			if(current.x != i or current.y != j):
				overlay.set_cell(Vector2i(i, j), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CANNOT_MOVE, 0))
	match self.id:
		AnimalType.AnimalType.SNAIL:
			draw_kings_move(overlay, current)
		AnimalType.AnimalType.BEE:
			draw_queen_move(overlay, current)
		AnimalType.AnimalType.GRASS_HOPPER:
			draw_knight_move(overlay, current)
		AnimalType.AnimalType.SPIDER:
			draw_bischop_move(overlay, current)
		AnimalType.AnimalType.HAMSTER:
			draw_shorten_tower_move(overlay, current)
		AnimalType.AnimalType.MOLE:
			draw_tower_move(overlay, current)
		AnimalType.AnimalType.BAT:
			draw_darkness_move(overlay, current, lamp_positions)
		AnimalType.AnimalType.MOTH:
			draw_lamp_move(overlay, current, lamp_positions)
		AnimalType.AnimalType.FLY:
			draw_shorten_bischop_move(overlay, current)
	overlay.set_cell(Vector2i(current.x, current.y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.SELECTED, 0))
		
func draw_shorten_tower_move(overlay: TileMapLayer, current: Vector2i): # chomik
	for i in [-1, 0, 1]: 
		# Horizontal moves (left and right)
		if current.x + i >= 0 and current.x + i < 9 and i != 0:
			overlay.set_cell(Vector2i(current.x + i, current.y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		# Vertical moves (up and down)
		if current.y + i >= 0 and current.y + i < 9 and i != 0:
			overlay.set_cell(Vector2i(current.x, current.y + i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
func draw_tower_move(overlay: TileMapLayer, current: Vector2i): # krtek
	for x in range(0, 9):
		overlay.set_cell(Vector2i(x, current.y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE,0))
	for y in range(0, 9):
		overlay.set_cell(Vector2i(current.x, y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE,0))
func draw_lamp_move(overlay: TileMapLayer, current: Vector2i, lamps: Array):#lamp tp moth
	for lamp: Vector2i in lamps:
		overlay.set_cell(Vector2i(lamp.x, lamp.y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE,0))
func draw_darkness_move(overlay: TileMapLayer, current: Vector2i, lamps: Array): #bat 
	draw_full_move(overlay, current)
	for lamp: Vector2i in lamps:
		overlay.set_cell(Vector2i(lamp.x, lamp.y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CANNOT_MOVE,0))
func draw_shorten_bischop_move(overlay: TileMapLayer, current: Vector2i): #fly
	for i in range(1, 2):
		if (current.x + i < 9 and current.y + i < 9):
			overlay.set_cell(Vector2i(current.x + i, current.y + i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		if (current.x - i >= 0 and current.y - i >= 0):
			overlay.set_cell(Vector2i(current.x - i, current.y - i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		
		if (current.x + i < 9 and current.y - i >= 0):
			overlay.set_cell(Vector2i(current.x + i, current.y - i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		if (current.x - i >= 0 and current.y + i < 9):
			overlay.set_cell(Vector2i(current.x - i, current.y + i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
func draw_bischop_move(overlay: TileMapLayer, current: Vector2i): #spider
	for i in range(1, 9): 
		if (current.x + i < 9 and current.y + i < 9):
			overlay.set_cell(Vector2i(current.x + i, current.y + i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		if (current.x - i >= 0 and current.y - i >= 0):
			overlay.set_cell(Vector2i(current.x - i, current.y - i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		
		if (current.x + i < 9 and current.y - i >= 0):
			overlay.set_cell(Vector2i(current.x + i, current.y - i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
		if (current.x - i >= 0 and current.y + i < 9):
			overlay.set_cell(Vector2i(current.x - i, current.y + i), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
func draw_knight_move(overlay: TileMapLayer, current: Vector2i): #grasshopper
	var knight_moves = [
		Vector2i(2, 1), Vector2i(2, -1),  # Right 2, up/down 1
		Vector2i(-2, 1), Vector2i(-2, -1), # Left 2, up/down 1
		Vector2i(1, 2), Vector2i(1, -2),   # Up 2, left/right 1
		Vector2i(-1, 2), Vector2i(-1, -2)  # Down 2, left/right 1
	]

	for move in knight_moves:
		var new_position = current + move
		if new_position.x >= 0 and new_position.x < 9 and new_position.y >= 0 and new_position.y < 9:
			overlay.set_cell(new_position, OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE, 0))
func draw_queen_move(overlay: TileMapLayer, current: Vector2i):
	draw_bischop_move(overlay, current)
	draw_tower_move(overlay, current)
func draw_full_move(overlay: TileMapLayer, current: Vector2i): #bee
	for x in range(0, 9):
		for y in range(0, 9):
			overlay.set_cell(Vector2i(x, y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE,0))
func draw_kings_move(overlay: TileMapLayer, current: Vector2i): #snail
	for i in range(-1,2):
		for j in range(-1, 2):
			var new_x = current.x + i
			var new_y = current.y + j
			if new_x > -1 && new_x < 9 && new_y > -1 && new_y < 9:
				overlay.set_cell(Vector2i(new_x, new_y), OVERLAY_SOURCE_ID, Vector2i(Overlay.OverlayType.CAN_MOVE,0))
	
	
func get_animal_sprite():
	return Rect2(id*66, 0, 66, 66)
		
