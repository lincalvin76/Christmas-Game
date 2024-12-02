extends Label

var label = Label

func _ready():
	label = $"."

func _process(delta):
	label.text = "Tasks: " + str(Global.tasks) + "/17"
