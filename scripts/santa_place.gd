extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var fake_santa = load("res://scenes/remove_placeable/Fake_Santa.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_place_santa")
	
func _place_santa():
	var santa
	santa = fake_santa.instantiate()
	santa.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(santa)
	
	Global.tasks += 1
	queue_free()
	
