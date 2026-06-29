extends Node2D

class_name Game

var car_scene: PackedScene = preload("res://scenes/car.tscn")

func _on_finish_area_body_entered(body: Node2D) -> void:
	print('Player has entered')


func _on_car_timer_timeout() -> void:
	# 씬을 인스턴스화(메모리에 저장)
	var car: Area2D = car_scene.instantiate()
	
	# 시그널과 (외부)메소드를 수동으로 연결
	car.connect("body_entered", back_to_title)
	
	# [주의] Car._ready()가 호출되기 전에 position 값을 설정
	var random_marker: Marker2D = $CarSpawners.get_children().pick_random()	
	car.position = random_marker.position

	# 씬 인스턴스를 자식 노드로 추가
	# [주의] Car._ready()는 노드가 씬 트리에 추가되는 이 타이밍에 호출된다
	$Objects.add_child(car)


func back_to_title(_body: Node2D) -> void:
	print("Back to title")
