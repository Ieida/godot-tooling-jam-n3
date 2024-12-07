class_name EnemyAttackRipple extends EnemyAttack


@export var area: Area2D
@export var force: float = 32.0
@export var frequency: float = 16.0
@export var amplitude: float = 3.0
var time: float


func _physics_process(delta):
	time += delta
	for a in area.get_overlapping_bodies():
		if a is CharacterBody2D: _process_character_body(a, delta)


func _process_character_body(body: CharacterBody2D, delta: float):
	var d = area.global_position.direction_to(body.global_position)
	var dst = area.global_position.distance_to(body.global_position)
	var st = (sin(time * frequency) + 1.0) * amplitude * 0.5
	var sd = (sin(dst * frequency) + 1.0) * amplitude * 0.5
	var t = clampf(st * sd, 0.2, 0.9)
	var p = dst / 64.0
	var f = (1.0 - p) * t * force
	body.velocity = d * f
	body.move_and_slide()
	
	if t >= 0.9 and body.has_method(&"damage"): body.damage(damage * delta)
