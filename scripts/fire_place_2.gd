extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var fire_place = load("res://scenes/fire_place3.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_decor_game")
	
func _decor_game():
	remove_child(interaction_area)
	
	#game stuff
	Global.game = 3
	var decor = load("res://scenes/Fire Place Decor Game.tscn").instantiate()
	sprite.get_parent().get_parent().get_parent().add_child(decor)
	
	var fp
	fp = fire_place.instantiate()
	fp.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(fp)
	
	queue_free()
