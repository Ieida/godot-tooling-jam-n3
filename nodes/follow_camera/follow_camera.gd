class_name FollowCamera extends Camera2D


@export var target: Node2D
@export var max_distance: float = 32.0


func _process(delta):
	if target: follow(delta)


func follow(delta: float):
	var tp = target.global_position
	if target is CharacterBody2D: tp += target.velocity * delta
	var dst = global_position.distance_to(tp)
	if dst < delta:
		global_position = tp
	else:
		var pct = dst / max_distance
		global_position = global_position.lerp(tp, pct)
