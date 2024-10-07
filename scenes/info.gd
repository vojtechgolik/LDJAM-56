extends Button
@onready var creature_manual: Control = $"../../CreatureManual"
@onready var layer_holder: Node2D = $"../../layer_holder"
@onready var game_timer: Timer = $"../../layer_holder/GameTimer"
@onready var global_time: Timer = $"../../GlobalTime"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	creature_manual.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_toggled(toggled_on: bool) -> void:
	#if toggled_on:
		#set_text("Close")
		#update_minimum_size()
	#else:
		#set_text("Guide")
		#update_minimum_size()
	
	creature_manual.visible = toggled_on
	if (not global_time.is_stopped()):
		layer_holder.visible = !toggled_on
		get_tree().set_pause(toggled_on)
