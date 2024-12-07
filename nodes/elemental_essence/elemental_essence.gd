class_name ElementalEssence extends Area2D


@export var element: Element
var velocity: Vector2
var damping: float


func _physics_process(delta):
	var d = (velocity * damping * delta).limit_length(velocity.length())
	velocity -= d
	global_position += velocity * delta


func attract(_to: Vector2, _force: float):
	pass
