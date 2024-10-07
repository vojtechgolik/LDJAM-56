extends Button
@onready var creature_manual: Control = $"../../CreatureManual"
@onready var layer_holder: Node2D = $"../../layer_holder"
@onready var game_timer: Timer = $"../../layer_holder/GameTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	creature_manual.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_toggled(toggled_on: bool) -> void:
	creature_manual.visible = toggled_on
	if (not game_timer.is_stopped()):
		layer_holder.visible = !toggled_on
