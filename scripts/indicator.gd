extends Node2D

func _process(delta: float) -> void:
	if Global.game != 0:
		$Label.visible = false
	else:
		$Label.visible = true
