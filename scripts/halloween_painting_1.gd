extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var painting = load("res://scenes/remove_placeable/Christmas_Painting1.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_change_painting")
	
func _change_painting():
	var painting_1
	painting_1 = painting.instantiate()
	painting_1.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(painting_1)
	
	
	Global.tasks += 1
	queue_free()
	
