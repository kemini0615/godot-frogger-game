extends CharacterBody2D

class_name Player

var direction: Vector2 = Vector2.ZERO
var speed: float = 100

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")

	# velocity를 설정해도 move_and_slide()를 호출하지 않으면, 오브젝트는 움직이지 않는다
	velocity = direction * speed
	move_and_slide()
