extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, "_remove_cobweb")
	
func _remove_cobweb():
	Global.tasks += 1
	queue_free()
	