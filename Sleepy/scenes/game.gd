extends Node2D

func _process(delta):
	$Panel/yourscore.text = "Your Score: " + str(Score.score)
	$Panel/highscore.text = "High Score: " + str(Score.highscore)
	if Score.score >= 360:
		get_tree().change_scene_to_file("res://scenes/winover.tscn")
