extends Camera3D

#intensity of rotation effect
@export var intensity: float = 0.1

var original_rotation: Vector3

func _ready():
	original_rotation = rotation_degrees

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var offset_rotation = Vector3(
		mouse_pos.y * intensity, 
		-mouse_pos.x * intensity, 
		0
	)
	rotation_degrees = original_rotation + offset_rotation
