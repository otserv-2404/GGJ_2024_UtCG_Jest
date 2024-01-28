extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		$VideoStreamPlayer.play()
		$IntroStarted.visible = false
		
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://Assets/scenes/main.tscn")


func _on_video_stream_player_finished():
	$IntroFinished.visible = true
	$AnimationPlayer.play("fade_out")
