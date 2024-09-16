extends Button

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/title screen/how_to_play.tscn")
