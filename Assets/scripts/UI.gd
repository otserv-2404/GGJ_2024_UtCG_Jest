extends CanvasLayer
class_name UI

var score = 0:
	set(new_score):
		score = new_score
		_update_score_label()

func _update_score_label():
	#score_label.text = str(score)
	pass

func _ready():
	_update_score_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
