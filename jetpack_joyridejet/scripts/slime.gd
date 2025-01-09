extends Node2D

var rand_value: int
var speed = 100
var death_animation_string = ""
var dead = false

@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	rand_value = randi_range(1,6)
	
	if rand_value == 1 || rand_value == 3:
		speed = 500 * Global.increasing_speed
		
	elif rand_value == 2:
		speed = 300 * Global.increasing_speed
		
	else:
		speed = 150 * Global.increasing_speed
		
	animated_sprite_2d.play("slime"+str(rand_value))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta*speed
	
	if position.x < -25:
		queue_free()

func death_animation():
	$death_sound.play()
	if dead:
		return
	if rand_value == 1 || rand_value == 6:
		death_animation_string = "death1"
		
	elif rand_value == 2 || rand_value == 5:
		death_animation_string = "death2"
		
	else:
		death_animation_string = "death3"
	dead = true
	animated_sprite_2d.play(death_animation_string)
	animated_sprite_2d.animation_looped.connect(death_tween)
	var tween_speed: Tween = create_tween()
	tween_speed.tween_property(self, "speed", 300 * Global.increasing_speed , 0.75)
	
func death_tween():
	animated_sprite_2d.set_frame_and_progress(9, 0)
	animated_sprite_2d.pause()
	
	var tween_visiblity: Tween = create_tween()
	tween_visiblity.tween_property(self, "modulate", Color(1,1,1,0),0.5 )
	tween_visiblity.tween_callback(queue_free)
