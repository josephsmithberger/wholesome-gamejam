extends Area3D

var is_held: bool = false
var last_position: Vector3 = Vector3()

func _on_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_held = true
				last_position = position  # Store the current position
			else:
				is_held = false
				# Return to the last position if the z position is less than -3
				if position.z < -3:
					position = last_position

func _process(delta: float) -> void:
	if is_held:
		var mouse_pos = get_viewport().get_mouse_position()

		# Get the camera
		var camera = get_viewport().get_camera_3d()

		# Project the mouse position onto a 3D ray
		var ray_origin = camera.project_ray_origin(mouse_pos)
		var ray_direction = camera.project_ray_normal(mouse_pos)

		# Find the intersection with a horizontal plane (XZ plane at the object's current Y position)
		var intersection_y = position.y  # Keep object's current Y position
		var t = (intersection_y - ray_origin.y) / ray_direction.y  # Solve for t to find the intersection point
		
		# Update the position while held
		position.x = ray_origin.x + ray_direction.x * t
		position.z = ray_origin.z + ray_direction.z * t
		# Keep the Y position fixed to simulate movement in a flat plane
