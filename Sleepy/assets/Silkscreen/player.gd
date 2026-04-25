extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("shoot"):
		await  get_tree().create_timer(0.1).timeout
		fire()
		
func fire():
	var bullet = preload("res://scenes/bullet.tscn")
	var firedBullet = bullet.instantiate()
	firedBullet.position += Vector2(position.x,self.position.y - 80)
	get_parent().call_deferred("add_child",firedBullet)
	print(firedBullet.position,self.position)
	print("func fired")
