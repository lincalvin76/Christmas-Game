extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	Global.counter += 1
	#print(Global.counter)
	
func _process(delta: float) -> void:
	if Global.game == 2:
		if Global.counter == 10:
			self.get_parent().queue_free()
			Global.tasks += 1
			Global.counter = 0
			Global.game = 0
