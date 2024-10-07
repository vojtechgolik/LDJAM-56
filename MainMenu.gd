extends Control
@onready var start: Button = $CenterContainer/VBoxContainer3/ButtonContainer/Start
@onready var exit: Button = $CenterContainer/VBoxContainer3/ButtonContainer/Exit
@onready var difficulty_menu: Control = $"../DifficultyMenu"
@onready var label: Label = $CenterContainer/VBoxContainer3/LabelContainer/MarginContainer/Label
@onready var layer_holder: Node2D = $"../layer_holder"
@onready var game_time: Timer = $"../layer_holder/GameTimer"
@onready var inventory: Node2D = $"../Inventory"
@onready var global_time: Timer = $"../GlobalTime"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true
	layer_holder.visible = false
	inventory.visible = false
	start.pressed.connect(self.start_game)
	exit.pressed.connect(self.exit_game)
	get_tree().set_pause(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_game():
	self.visible = false
	#difficulty_menu.visible = true
	layer_holder.visible = true
	get_tree().set_pause(false)
	game_time.start()
	global_time.start()

func exit_game():
	get_tree().quit()
