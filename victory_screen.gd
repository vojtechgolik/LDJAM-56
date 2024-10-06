extends Control
@onready var restart: Button = $CenterContainer/VBoxContainer/ButtonMargin/ButtonContainer/Restart
@onready var exit: Button = $CenterContainer/VBoxContainer/ButtonMargin/ButtonContainer/Exit
@onready var time_value: Label = $CenterContainer/VBoxContainer/TimeContainer/TimeValue
@onready var round_value: Label = $CenterContainer/VBoxContainer/RoundContainer/RoundValue
@onready var layer_holder: Node2D = $"../layer_holder"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	restart.pressed.connect(self.restart_pressed)
	exit.pressed.connect(self.exit_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_victory_screen(time: int, rounds: int):
	layer_holder.visible = false
	self.visible = true
	time_value.text = str(time)
	round_value.text = str(rounds)
	
func restart_pressed():
	pass
	
func exit_game():
	get_tree().quit()
