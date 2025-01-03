extends Node2D

var speed = 3
var direction = speed/3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D/AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += speed
	position.x = position.x + direction
	
	if position.y > 250:
		queue_free()

func left_right(dir):
	if dir == "left":
		direction = -speed/3
	elif dir == "right":
		direction = speed/3
	elif dir == "down":
		direction = 0
		
