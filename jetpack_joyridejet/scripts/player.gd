extends CharacterBody2D

const JUMP_VELOCITY = -25

var on_ground = false
var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	# Handle jump.
	if Input.is_action_pressed("ui_accept"):
		$AnimatedSprite2D.play("flying")
		velocity.y += JUMP_VELOCITY
		
		if $bullet_timer.is_stopped():
			shoot_bullet("left")
			shoot_bullet("right")
			shoot_bullet("down")
			$bullet_timer.start()
			
	elif is_on_floor():
		$AnimatedSprite2D.play("running")
	
	else:
		$AnimatedSprite2D.play("falling")
		
		
		
		
	move_and_slide()

func shoot_bullet(direction):
	var bullet = bullet_scene.instantiate()
	bullet.position = $Marker2D.position
	bullet.left_right(direction)
	add_child(bullet)
