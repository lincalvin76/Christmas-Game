extends CharacterBody2D

var selected = false
var is_on_floor: bool = true
var gravity:int = ProjectSettings.get_setting("physics/2d/default_gravity")
var CLICK_THRESHOLD = 64.0
const FLICK_POWER = 1000.0
	
func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		look_at(get_global_mouse_position())
	
	if not is_on_floor:
		velocity.y += gravity * delta
	
		move_and_slide()
		
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and (event.global_position - global_position).length() < CLICK_THRESHOLD:
			selected = true
			is_on_floor = true
			velocity.y = 0
			velocity = Vector2(0, 0)
		elif selected:
			selected = false
			is_on_floor = false
			if (event.global_position - global_position).length() > CLICK_THRESHOLD:
				var flick_vector: Vector2 = (event.global_position - global_position)
				velocity = flick_vector.normalized() * FLICK_POWER
