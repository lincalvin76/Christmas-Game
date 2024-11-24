extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var decorated_tree = load("res://scenes/decorated_tree.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_decorate_tree")
	
func _decorate_tree():
	remove_child(interaction_area)
	
	var tree_node = load("res://scenes/Tree Decor Game.tscn").instantiate()
	sprite.get_parent().get_parent().get_parent().add_child(tree_node)
	
	var t
	t = decorated_tree.instantiate()
	t.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(t)
	
	queue_free()
