extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D/AnimatedSprite2D.play("slime"+str(randi_range(1,6)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta*randi_range(100,300)
	
	if position.x < -25:
		queue_free()
