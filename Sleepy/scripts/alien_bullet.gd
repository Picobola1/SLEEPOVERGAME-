extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += 2


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/over.tscn")

	if body.name == "Shot":
		queue_free()
		
	if body.is_in_group("blocks"):
		queue_free()
		



func _on_area_entered(area):
	if area.is_in_group("blocks"):
		queue_free()
