extends Node2D

var speed = 10
var direction = speed/3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$bullet_area2D/AnimatedSprite2D.play()
	$AudioStreamPlayer2D.play()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += speed
	position.x = position.x + direction
	

func left_right(dir):
	if dir == "left":
		direction = -speed/3
	elif dir == "right":
		direction = speed/3
	elif dir == "down":
		direction = 0
		


func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("slime"):
		queue_free()
		area.get_parent().death_animation()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("floor"):
		play_particle_anim()


func play_particle_anim():
	$bullet_area2D/AnimatedSprite2D.visible = false
	$GPUParticles2D.restart()

func _on_timer_timeout() -> void:
	queue_free()


func _on_gpu_particles_2d_finished() -> void:
	queue_free()
