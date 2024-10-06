extends Control
@onready var difficulty_menu: Control = $"."
@onready var easy: Button = $CenterContainer/VBoxContainer/ButtonContainer/Easy
@onready var hard: Button = $CenterContainer/VBoxContainer/ButtonContainer/Hard
@onready var close: Button = $CenterContainer/VBoxContainer/Close
@onready var main_menu: Control = $"../MainMenu"
@onready var layer_holder: Node2D = $"../layer_holder"
@onready var game_time: Timer = $"../GameTime"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	difficulty_menu.visible = false
	easy.pressed.connect(self.easy_picked)
	hard.pressed.connect(self.hard_picked)
	close.pressed.connect(self.close_window)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func easy_picked():
	print("Picked easy difficulty")
	difficulty_menu.visible = false
	layer_holder.visible = true
	get_tree().set_pause(false)
	game_time.start()
	
func hard_picked():
	print("Picked hard difficulty")
	difficulty_menu.visible = false
	layer_holder.visible = true
	get_tree().set_pause(false)
	game_time.start()

func close_window():
	difficulty_menu.visible = false
	main_menu.visible = true
