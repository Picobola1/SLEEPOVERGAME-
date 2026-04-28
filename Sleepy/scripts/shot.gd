extends CharacterBody2D

var life_time=2
var life_spawn=0
var speed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(Vector2.UP * delta * speed)
	if collision and collision.get_collider().has_method("kill"):
		collision.get_collider().kill()
		Score.score += 10

		queue_free()
		self.queue_free()
		print("hi")

	life_spawn += delta
	if life_spawn >= life_time:
		queue_free()
