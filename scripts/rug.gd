extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var tree = load("res://scenes/tree.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_remove_rug")
	
func _remove_rug():
	var t
	t = tree.instantiate()
	t.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(t)
	
	Global.tasks += 1
	queue_free()
