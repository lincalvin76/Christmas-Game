extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, "_decorate_tree")
	
func _decorate_tree():
	remove_child(interaction_area)
	print("run decorate stuff")
	get_tree().change_scene_to_file("res://scenes/Tree Decor Game.tscn")
