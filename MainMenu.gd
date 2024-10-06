extends Control
@onready var start: Button = $CenterContainer/VBoxContainer3/ButtonContainer/Start
@onready var exit: Button = $CenterContainer/VBoxContainer3/ButtonContainer/Exit
@onready var difficulty_menu: Control = $"../DifficultyMenu"
@onready var timer: Timer = $"../Timer"
@onready var label: Label = $CenterContainer/VBoxContainer3/LabelContainer/MarginContainer/Label
@onready var layer_holder: Node2D = $"../layer_holder"
@onready var game_time: Timer = $"../GameTime"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true
	layer_holder.visible = false
	start.pressed.connect(self.start_game)
	exit.pressed.connect(self.exit_game)
	get_tree().set_pause(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start_game():
	self.visible = false
	difficulty_menu.visible = true
	#game_time.start()

func exit_game():
	get_tree().quit()
