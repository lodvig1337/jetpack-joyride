extends Node2D

var box_sprite = preload("res://pngs/obstacle/1_Idle.png")

var box_sprites = [
	preload("res://pngs/obstacle/1_Idle.png"), 
	preload("res://pngs/obstacle/2_Idle.png"), 
	preload("res://pngs/obstacle/3_Idle.png")
]

func _ready() -> void:
	$Area2D/Sprite2D.texture = box_sprites.pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.game_over()
