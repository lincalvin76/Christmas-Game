extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var snowman = load("res://scenes/remove_placeable/Snowman.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_place_snowman")
	
func _place_snowman():
	var snow
	snow = snowman.instantiate()
	snow.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(snow)
	
	
	Global.tasks += 1
	queue_free()
	
