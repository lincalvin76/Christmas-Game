extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var ornament_place = load("res://scenes/remove_placeable/ornament_place.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_remove_cobweb")
	
func _remove_cobweb():
	var ornament
	ornament = ornament_place.instantiate()
	ornament.global_position = sprite.global_position
	ornament.position.x -= 35
	sprite.get_parent().get_parent().add_child(ornament)
	
	Global.tasks += 1
	queue_free()
	
