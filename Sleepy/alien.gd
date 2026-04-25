extends CharacterBody2D

var move_Speed = 25
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(Vector2.DOWN * delta * move_Speed)

func kill():
	queue_free()
