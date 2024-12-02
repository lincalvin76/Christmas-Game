extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var painting = load("res://scenes/remove_placeable/Christmas_Painting2.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_change_painting")
	
func _change_painting():
	var painting_2
	painting_2 = painting.instantiate()
	painting_2.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(painting_2)
	
	Global.tasks += 1
	queue_free()
	
