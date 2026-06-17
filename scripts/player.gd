extends Node2D

class_name Player

var direction: Vector2 = Vector2.ZERO
var speed: float = 5

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	position += direction * speed

	if (Input.is_action_just_pressed("confirm")):
		print("You pressed 'space'.")
