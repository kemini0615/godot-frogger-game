extends Control

class_name Title


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
