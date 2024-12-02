extends Control

func _on_button_pressed() -> void: # start
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_button_2_pressed() -> void: # credits
	var credit_node = load("res://scenes/credits.tscn").instantiate()
	self.add_child(credit_node)


func _on_button_3_pressed() -> void:
	var tutorial_node = load("res://scenes/how_to_play.tscn").instantiate()
	self.add_child(tutorial_node)
