class_name EnemyAttackRipple extends EnemyAttack


@export var area: Area2D
@export var force: float = 32.0
@export var frequency: float = 16.0
@export var amplitude: float = 3.0
var time: float


func _physics_process(_delta):
	time += _delta
	for a in area.get_overlapping_bodies():
		if a is CharacterBody2D: _process_character_body(a)


func _process_character_body(body: CharacterBody2D):
	var d = area.global_position.direction_to(body.global_position)
	var dst = area.global_position.distance_to(body.global_position)
	var st = (sin(time * frequency) + 1.0) * amplitude * 0.5
	var sd = (sin(dst * frequency) + 1.0) * amplitude * 0.5
	var t = st * sd
	var p = dst / 64.0
	var f = (1.0 - p) * t * force
	body.velocity = d * f
	body.move_and_slide()
