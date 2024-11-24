extends StaticBody2D

@export_enum("STAR:0", "ORNAMENT:1", "PRESENT:2") 
var type : int

@export var filled : bool

func _ready():
	if self.type == 0:
		modulate = Color(Color.YELLOW, 0.7)
	if self.type == 1:
		modulate = Color(Color.RED, 0.7)
	if self.type == 2:
		modulate = Color(Color.WHITE, 0.7)
		
func _process(delta):
	if Global.is_dragging && !filled:
		visible = true
	else:
		visible = false
		
