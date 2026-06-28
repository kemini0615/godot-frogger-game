extends CharacterBody2D

class_name Player

var direction: Vector2 = Vector2.ZERO
var speed: float = 100

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")

	# velocity를 설정해도 move_and_slide()를 호출하지 않으면, 오브젝트는 움직이지 않는다
	velocity = direction * speed
	move_and_slide()
	play_animation()

func play_animation():
	if direction:
		$AnimatedSprite2D.flip_h = direction.x > 0 # 오른쪽으로 이동하면 X축 플립
		if direction.x != 0:
			$AnimatedSprite2D.animation = 'left'
		else:
			$AnimatedSprite2D.animation = 'down' if direction.y > 0 else 'up'	
	else:
		$AnimatedSprite2D.frame = 0 # 애니메이션 프레임을 수동으로 고정
