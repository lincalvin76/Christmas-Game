extends StaticBody2D

@onready var interaction_area = $InteractionArea
@onready var 	sprite = $Sprite2D

var milk_cookies = load("res://scenes/remove_placeable/Milk_Cookies.tscn")

func _ready():
	interaction_area.interact = Callable(self, "_place_milk_cookies")
	
func _place_milk_cookies():
	var milk_and_cookies
	milk_and_cookies = milk_cookies.instantiate()
	milk_and_cookies.global_position = sprite.global_position
	sprite.get_parent().get_parent().add_child(milk_and_cookies)
	
	
	Global.tasks += 1
	queue_free()
	
