extends CharacterBody2D
const SPEED = 3000.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("right"):
		direction = 1
	if Input.is_action_just_pressed("left"):
		direction = -1
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
	$Gunshot.play()

func _on_area_2d_body_entered(body):
	if body.is_in_group("alien"):
		get_tree().change_scene_to_file("res://scenes/over.tscn")
		
