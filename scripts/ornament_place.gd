extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var ornaments = load("res://scenes/remove_placeable/Ornaments.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_place_ornament")
	
func _place_ornament():
	var ornament
	ornament = ornaments.instantiate()
	ornament.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(ornament)
	
	Global.tasks += 1
	queue_free()
	
