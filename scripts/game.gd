extends Node2D

class_name Game

var car_scene: PackedScene = preload("res://scenes/car.tscn")

var score: int = 0


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
	
func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = 'SCORE: ' + str(score)
	
	
func _on_finish_area_body_entered(_body: Node2D) -> void:
	# 물리 연산 중에 Collision Object를 제거(씬 교체)할 때는 call_deferred() 사용을 권장
	# call_deferred()는 지정한 함수를 즉시 호출하지 않고, 현재 물리 연산이 끝난 후 안전하게 호출한다
	call_deferred("change_scene")
	
	
func back_to_title(_body: Node2D) -> void:
	call_deferred("change_scene")


func change_scene():
	get_tree().change_scene_to_file("res://scenes/title.tscn")
