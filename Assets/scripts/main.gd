extends Node

var mousePosLabel = "%.0f, %.0f"
var mousePos

var screenSize
var cameraSpeed = 10.0

@onready var global = get_node("/root/Global")
@onready var bg = $Background
@onready var player = $Player
@onready var camera = $Player/Camera

# Called when the node enters the scene tree for the first time.
func _ready():	
	#Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	#player.position = Vector2(bg.texture.get_width()/3.0, bg.texture.get_height()/2)
	#bg.position = Vector2(bg.texture.get_width()/3.0, bg.texture.get_height()/2)
	screenSize = get_viewport().get_visible_rect().size
	
	var startSwitch = $Trono
	startSwitch.start_sequence.connect(_on_start_sequence)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousePos = get_viewport().get_mouse_position()
	
	

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
func _on_start_sequence():
	for i in global.objectiveNum:
		#var animPlayer = global.objectiveGroup[global.objectives[i]].get_node("AnimationPlayer")
		#animPlayer.play("activate")
		if !global.objectives[i]:
			break
		elif i == global.objectiveNum-1:
			print("All objectives complete!")
