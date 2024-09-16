extends Timer


func _ready() -> void:
	$"../CanvasLayer/CenterContainer".hide()
	$"../CanvasLayer/ColorRect".hide()
func _on_timeout() -> void:
	$"../CanvasLayer/CenterContainer".show()
	$"../button anim".play("into")

func _on_button_pressed() -> void:
	$"../CanvasLayer/ColorRect".show()
	$"../CanvasLayer/CenterContainer".hide()

func _on_no_pressed() -> void:
	$"../CanvasLayer/ColorRect".hide()
	$"../CanvasLayer/CenterContainer".show()
	$"../button anim".play("into")


func _on_yes_pressed() -> void:
	$"../button anim".play("finished")


func _on_button_anim_animation_finished(anim_name: StringName) -> void:
	if anim_name == "finished":
		get_tree().change_scene_to_file("res://assets/title screen/goodbye.tscn")
