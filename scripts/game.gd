extends Node2D

class_name Game

func _on_finish_area_body_entered(body: Node2D) -> void:
	print('Player has entered')
