extends Label

var label = Label
var time = Timer
@export var new_color : Color
@export var original_color : Color

const TOTAL_TASKS : int = 17

func _ready():
	label = $"."
	time = $"../Timer"
	label.modulate = original_color
	
	time.start()

func _process(delta):
	label.text = str(ceil(time.time_left))
	
	if time.time_left <= 10:
		label.modulate = new_color
	else:
		label.modulate = original_color
		

func _on_timer_timeout() -> void:
	if Global.tasks != TOTAL_TASKS:
		get_tree().change_scene_to_file("res://scenes/lose.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
