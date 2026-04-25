extends CharacterBody2D

var move_Speed = 25
var shootingCount = randi_range(0,50)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(Vector2.DOWN * delta * move_Speed)
	shootingCount += delta
	if shootingCount >= 50:
		var bullet = preload("res://alien_bullet.tscn")
		var firedBullet = bullet.instantiate()
		firedBullet.position += Vector2(position.x,position.y)
		get_parent().call_deferred("add_child",firedBullet)
		
		shootingCount = randi_range(0,50)
		

func kill():
	queue_free()
