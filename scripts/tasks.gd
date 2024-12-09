extends Label

var label = Label

func _ready():
	label = $"."

func _process(delta):
	label.text = "Tasks: " + str(Global.tasks) + "/17"
	if Global.tasks == 17:
		Global.game = 0
		Global.tasks = 0
		get_tree().change_scene_to_file("res://scenes/win.tscn")
