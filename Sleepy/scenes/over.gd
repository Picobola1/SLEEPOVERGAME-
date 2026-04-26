extends Control
var score = Score.score
var highscore = Score.highscore

func _ready() -> void: 
	$yourscore.text = "Your Score: " + str(score)
	
	if score > highscore:
		highscore = 
	$highscore.text = "High Score: " + str(Score.highscore)

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn") 
