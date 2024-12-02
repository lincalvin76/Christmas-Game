extends Node2D

func _process(delta: float) -> void:
	if Global.game == 0:
		queue_free()
