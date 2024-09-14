extends Camera3D

@export var intensity: float = 0.1
@export var ease_speed: float = 5.0

var original_rotation: Vector3
var target_rotation: Vector3

func _ready():
	original_rotation = rotation_degrees
	target_rotation = rotation_degrees

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var offset_rotation = Vector3(
		mouse_pos.y * intensity, 
		-mouse_pos.x * intensity, 
		0
	)
	target_rotation = original_rotation + offset_rotation
	
	rotation_degrees.x = lerp_angle(rotation_degrees.x, target_rotation.x, delta * ease_speed)
	rotation_degrees.y = lerp_angle(rotation_degrees.y, target_rotation.y, delta * ease_speed)
	rotation_degrees.z = lerp_angle(rotation_degrees.z, target_rotation.z, delta * ease_speed)
