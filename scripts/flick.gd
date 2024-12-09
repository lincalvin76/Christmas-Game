extends CharacterBody2D

const CLICK_THRESHOLD = 64.0
const FLICK_POWER = 600.0

var gravity:int = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dragging: bool = false
var is_on_floor: bool = true
var dragged: bool = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and (event.global_position - global_position).length() < CLICK_THRESHOLD && !dragged:
			is_dragging = true
		elif is_dragging:
			is_dragging = false
			if (event.global_position - global_position).length() > CLICK_THRESHOLD:
				self.get_parent().z_index = -2
				dragged = true
				is_on_floor = false
				var flick_vector: Vector2 = (event.global_position - global_position)
				velocity = flick_vector.normalized() * FLICK_POWER
	
func _physics_process(delta: float) -> void:
	#if is_dragging:
	if not is_on_floor:
		velocity.y += gravity * delta
		$Sprite2D.rotation += 5 * delta
		
		
	move_and_slide()
