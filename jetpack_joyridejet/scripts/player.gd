extends CharacterBody2D

const JUMP_VELOCITY = -100
"res://scenes/start_screen.tscn"
var on_ground = false
var bullet_scene: PackedScene = preload("res://scenes/bullet.tscn")
var dead = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta * 3
		
	if Input.is_action_just_pressed("ui_accept"):
		if get_tree().paused:
			get_tree().paused = false
			get_tree().call_deferred("change_scene_to_file","res://scenes/start_screen.tscn")

	# Handle jump.
	if Input.is_action_pressed("ui_accept"):
		$AnimatedSprite2D.play("flying")
		velocity.y += JUMP_VELOCITY
		
		if $bullet_timer.is_stopped():
			shoot_bullet("left")
			shoot_bullet("right")
			shoot_bullet("down")
			$bullet_timer.start()
	
	elif get_tree().paused:
		if $AnimatedSprite2D.get_frame() == 7:
			$AnimatedSprite2D.visible = false
			death_sound()
		$AnimatedSprite2D.play("death")
		
	elif is_on_floor():
		walk_sound_func()
		$AnimatedSprite2D.play("running")
		
	else:
		$AnimatedSprite2D.play("falling")

	move_and_slide()

func shoot_bullet(direction):
	var bullet = bullet_scene.instantiate()
	bullet.global_position = $Marker2D.global_position
	bullet.left_right(direction)
	get_parent().add_child(bullet)

func walk_sound_func():
	if $walk_sound_timer.is_stopped():
		$walk_sound_timer.start()

func _on_walk_sound_timer_timeout() -> void:
	$walk_sound.play()

func death_sound():
	if not dead:
		dead = true
		$death.play()
