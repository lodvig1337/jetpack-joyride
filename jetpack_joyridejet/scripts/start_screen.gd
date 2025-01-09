extends Node2D

var main_scene = preload("res://scenes/main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/high_score.set_text("Hiscore: "+str(Global.highscore))
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
		Global.increasing_speed = 1
		
