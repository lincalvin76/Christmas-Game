extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var snowman_place = load("res://scenes/remove_placeable/snowman_place.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_remove_cobweb")
	
func _remove_cobweb():
	var snowman
	snowman = snowman_place.instantiate()
	snowman.global_position = sprite.global_position
	snowman.position.x += 20
	snowman.position.y += 10
	sprite.get_parent().get_parent().add_child(snowman)
	
	Global.tasks += 1
	queue_free()
	
