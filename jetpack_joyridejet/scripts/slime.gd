extends Node2D

var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand_value = randi_range(1,6)
	
	if rand_value == 1 || rand_value == 3:
		speed = 600
		
	elif rand_value == 2:
		speed = 500
		
	else:
		speed = 300
		
	$Area2D/AnimatedSprite2D.play("slime"+str(rand_value))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta*speed
	
	if position.x < -25:
		queue_free()
