extends Node2D

var slime_scene = preload("res://scenes/slime.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_slime(range):
	#spawn 2 slimes
	if range <= 2:
		spawn_slime_amount(100)
		spawn_slime_amount()
	elif range <= 7: 
		spawn_slime_amount()
	else:
		spawn_slime_amount(100)
		spawn_slime_amount(200)
		spawn_slime_amount()
		

func spawn_slime_amount(offset: int = 0):
	var slime_instance = slime_scene.instantiate()
	slime_instance.position = Vector2(1200 + offset, 625)
	add_child(slime_instance)


func _on_spawn_timer_timeout() -> void:
	$spawn_timer.wait_time = randf_range(1, 5)
	spawn_slime(randi_range(1,10))
