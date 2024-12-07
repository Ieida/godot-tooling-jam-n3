class_name ElementalEssenceAttractor extends Area2D


signal collected


@export var force: float = 64.0
var all_essence: Dictionary


func _physics_process(delta):
	for a in get_overlapping_areas():
		if a is ElementalEssence:
			attract(a, delta)


func attract(essence: ElementalEssence, delta: float):
	var d = essence.global_position.direction_to(global_position)
	var v = (d + d.orthogonal()) * force * delta
	essence.global_position += v
	
	if global_position.distance_to(essence.global_position) <= 4.0:
		collect(essence)


func collect(essence: ElementalEssence):
	var n = essence.element.name()
	if not all_essence.has(n):
		all_essence[n] = 0
	all_essence[n] += 1
	essence.queue_free()
	collected.emit()
