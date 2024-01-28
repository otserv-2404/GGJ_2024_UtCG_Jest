extends Node2D

@onready var global = get_node("/root/Global")

var initialScale
var mouseOver = false

func _ready():
	initialScale = scale


func _process(delta):
	if Input.is_action_just_pressed("click"):
		if mouseOver:
			print("action!")


func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		scale = Vector2(initialScale.x * 1.05, initialScale.y * 1.05)
		mouseOver = true


func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		scale = Vector2(initialScale.x * 1.0, initialScale.y * 1.0)
		mouseOver = false
