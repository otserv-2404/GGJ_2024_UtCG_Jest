extends StaticBody2D

@onready var global = get_node("/root/Global")

@export var dropPointId: int
# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.is_dragging:
		visible = true
	else:
		visible = false
