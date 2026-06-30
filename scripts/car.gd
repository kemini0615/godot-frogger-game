extends Area2D

class_name Car

var direction: Vector2 = Vector2.ZERO
var speed: float = 100

var variations = [
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png")
]


func _ready() -> void:
	if position.x > 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.RIGHT
		$Sprite2D.flip_h = true
		
	$Sprite2D.texture = variations.pick_random()


func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # 노드 인스턴스를 메모리에서 해제(제거)
