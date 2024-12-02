extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var sprite = $Sprite2D

func _ready():
	interaction_area.interact = Callable(self, "_skelly_game")
	
func _skelly_game():
	remove_child(interaction_area)
	
	var skelly_node = load("res://scenes/skeleton_throw.tscn").instantiate()
	sprite.get_parent().get_parent().get_parent().add_child(skelly_node)
	
	Global.game = 4
	queue_free()
	
