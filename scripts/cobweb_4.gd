extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var santa_place = load("res://scenes/remove_placeable/santa_place.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_remove_cobweb")
	
func _remove_cobweb():
	var santa
	santa = santa_place.instantiate()
	santa.global_position = sprite.global_position
	santa.position.x -= 30
	sprite.get_parent().get_parent().add_child(santa)
	
	Global.tasks += 1
	queue_free()
	
