class_name Hitbox extends Area2D


signal damaged
signal health_reached_zero


@export var health: float
@onready var default_health = health
var is_health_depleted: bool


func damage(amount: float):
	if is_health_depleted: return
	health -= amount
	if health <= 0.0:
		health = 0.0
		is_health_depleted = true
		health_reached_zero.emit()
	else:
		damaged.emit()


func get_health_percentage() -> float:
	if not is_node_ready(): return 1.0
	return health / default_health
