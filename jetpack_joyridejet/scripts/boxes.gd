class_name boxes
extends Node2D

@export var height: int = 1
@export var width: int = 1
var box_scene: PackedScene = preload("res://scenes/box.tscn")
var x_pos: int = 0
var y_pos: int = 0

var current_height: int = -1
var current_width: int = -1
var width_array = [null,null,null,null,null]
var height_array = [null,null,null,null,null]

var speed = 300 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.x < -300:
		queue_free()
		
	position.x -= delta * speed * Global.increasing_speed
	instantiate_box()
	


func instantiate_box():
	if width > len(width_array):
		width_array.resize(width)
	if height > len(height_array):
		height_array.resize(height)

	if current_width != width:
		for box_amount in range(width):
			if width_array[box_amount] == null:
				var box_instance = box_scene.instantiate()
				width_array[box_amount] = box_instance
				box_instance.position.x = 44 * (box_amount + 1)
				add_child(box_instance)
		
		for box_index in range(width, current_width):
			if width_array[box_index] != null:
				width_array[box_index].queue_free()
				width_array[box_index] = null
	
	if current_height != height:
		for box_amount in range(height):
			if height_array[box_amount] == null:
				var box_instance = box_scene.instantiate()
				height_array[box_amount] = box_instance
				box_instance.position.y = 44 * box_amount
				add_child(box_instance)
		
		for box_index in range(height, current_height):
			if height_array[box_index] != null:
				height_array[box_index].queue_free()
				height_array[box_index] = null

	current_width = width
	current_height = height
