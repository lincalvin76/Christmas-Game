extends Node2D

var draggable = false
var is_inside_dropable = false
var dropped = false
var body_ref
var offset : Vector2
var initialPos : Vector2

@onready var sprite = $Sprite2D

@export_enum("STAR:0", "ORNAMENT:1", "PRESENT:2") 
var type : int

func _ready() -> void:
	if self.type == 0:
		sprite.set_texture(load("res://assets/Star.png"))
	if self.type == 1:
		var num = randi() % 3
		if num == 0:
			sprite.set_texture(load("res://assets/Red_Ornament.png"))
		if num == 1:
			sprite.set_texture(load("res://assets/Blue_Ornament.png"))
		if num == 2:
			sprite.set_texture(load("res://assets/Purple_Ornament.png"))
		
	if self.type == 2:
		sprite.set_texture(load("res://icon.svg"))
		
func _process(delta):
	if Global.counter == 7:
		self.get_parent().queue_free()
		
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable && self.type == body_ref.type:
				dropped = true
				draggable = false
				Global.counter += 1
				print(Global.counter)
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				body_ref.filled = true
			else:
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
		

func _on_area_2d_body_entered(body : StaticBody2D):
	if body.is_in_group('dropable') && self.type == body.type && body.filled == false:
		is_inside_dropable = true
		if body.type == 0:
			body.modulate = Color(Color.DARK_GOLDENROD, 1)
		elif body.type == 1:
			body.modulate = Color(Color.DARK_RED, 1)
		elif body.type == 2:
			body.modulate = Color(Color.DIM_GRAY, 1)
		body_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		if body.type == 0:
			body.modulate = Color(Color.YELLOW, 0.7)
		elif body.type == 1:
			body.modulate = Color(Color.RED, 0.7)
		elif body.type == 2:
			body.modulate = Color(Color.WHITE, 0.7)


func _on_area_2d_mouse_entered():
	if not Global.is_dragging && not dropped:
		draggable = true
		scale = Vector2(1.05, 1.05)


func _on_area_2d_mouse_exited():
	if not Global.is_dragging:
		draggable = false
		scale = Vector2(1,1)
