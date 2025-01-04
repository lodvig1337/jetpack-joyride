extends Node2D

var box_sprites = [
	preload("res://pngs/obstacle/1_Idle.png"), 
	preload("res://pngs/obstacle/2_Idle.png"), 
	preload("res://pngs/obstacle/3_Idle.png")
]

var score: int = 0

var slime_scene = preload("res://scenes/slime.tscn")
var box_scene = preload("res://scenes/boxes.tscn")
@onready var box_timer = $box_spawn_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_boxes()

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

func spawn_boxes():
	var box_instance = box_scene.instantiate()
	box_instance.height = randi_range(1,5)
	box_instance.width = randi_range(1,5)
	box_instance.position = Vector2(1600, randi_range(-100, 550))
	add_child(box_instance)
	box_timer.start()

func _on_box_spawn_timer_timeout() -> void:
	spawn_boxes()


func _on_score_timer_timeout() -> void:
	score += 10
	$CanvasLayer/score_label.set_text(str(score))
