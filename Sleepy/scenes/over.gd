extends Control
var score = Score.score
var highscore = Score.highscore

func _ready() -> void: 
	if score > Score.highscore:
		Score.highscore = score
	
	$yourscore.text = "Your Score: " + str(score)
	$highscore.text = "High Score: " + str(Score.highscore)
	
	Score.score = 0

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
