extends Node2D

@export var spriteTexture: CompressedTexture2D

@onready var global = get_node("/root/Global")

@onready var collisionBox = $Area2D/CollisionShape2D

var draggable = false
var is_inside_droppable = false
var body_ref
var initialPos: Vector2
var initialScale
var offset: Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	initialScale = scale
	
	#$Sprite2D.texture = spriteTexture
	
	#collisionBox.shape.extents = Vector2(spriteTexture.get_width(), spriteTexture.get_height())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
			initialPos = global_position
			set_z_index(2)
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_droppable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"position",initialPos,0.2).set_ease(Tween.EASE_OUT)
			
			set_z_index(0)


func _on_area_2d_body_entered(body):
	if body.is_in_group("droppable"):
		is_inside_droppable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body


func _on_area_2d_body_exited(body):
	if body.is_in_group("droppable"):
		is_inside_droppable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
		body_ref = body


func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		draggable = true
		scale = Vector2(initialScale.x * 1.05, initialScale.y * 1.05)


func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false
		scale = Vector2(initialScale.x * 1.0, initialScale.y * 1.0)
