extends CharacterBody2D

var move_Speed = 15
var shootingCount = randi_range(0,50)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(Vector2.DOWN * delta * move_Speed)
	shootingCount += delta
	if shootingCount >= 50:
		var bullet = preload("res://scenes/alien_bullet.tscn")
		var firedBullet = bullet.instantiate()
		firedBullet.position += Vector2(position.x,position.y)
		get_parent().call_deferred("add_child",firedBullet)
		
		shootingCount = randi_range(0,50)

func kill():
	queue_free()
	
	


func _on_area_2d_body_entered(body):
	if body.name == "Shot":
		print("1")
		body.queue_free()
	if body.name == "Bullet":
		print("2")
		body.queue_free()
	if body.name == "shot":
		print("3")
		body.queue_free()
	if body.name == "bullet":
		body.queue_free()
		print("4")
	
	
