class_name ElementalEssenceSpawner extends Node2D


@export var essence_scene: PackedScene
@export var amount: int
@export var initial_velocity_min: float
@export var initial_velocity_max: float
@export var damping: float


func get_new_essence() -> ElementalEssence:
	var e = essence_scene.instantiate() as ElementalEssence
	get_tree().current_scene.add_child(e)
	e.global_position = global_position
	return e


func spawn():
	var a = 360.0 / float(amount)
	for i in amount:
		var d = Vector2.RIGHT.rotated(deg_to_rad(a * float(i)))
		var vl = randf_range(initial_velocity_min, initial_velocity_max)
		var e = get_new_essence()
		e.velocity = d * vl
		e.damping = damping
