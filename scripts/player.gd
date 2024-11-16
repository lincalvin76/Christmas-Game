extends CharacterBody2D

@export var move_speed : float = 500

func _physics_process(_delta):
	# Input Directions
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

	#Update velocity
	velocity = input_direction * move_speed

	#Move character
	move_and_slide()
