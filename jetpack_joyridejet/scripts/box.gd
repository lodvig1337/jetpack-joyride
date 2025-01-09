extends Node2D

var box_sprite = preload("res://pngs/obstacle/1_Idle.png")
var exploded = false
signal explode(Vector2)

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
		body.get_parent().game_over()



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "bullet_area2D" and not exploded and Global.player_powerup:
		$Area2D.set_deferred("monitoring", false)
		$Area2D/Sprite2D.visible = false
		$box_explosion.restart()


func _on_box_explosion_finished() -> void:
	queue_free()
