class_name Enemy extends CharacterBody2D


@export var animated_sprite: AnimatedSprite2D
@export var player: Player
@export var speed: float = 16.0
@export var ideal_distance_from_target: float = 16.0
var is_alive: bool = true


func _physics_process(_delta):
	if is_alive and player: chase()


func chase():
	if global_position.distance_to(player.global_position) <= ideal_distance_from_target: return
	
	var d = global_position.direction_to(player.global_position)
	velocity = d * speed
	move_and_slide()
	
	var a = rad_to_deg(Vector2.UP.angle_to(d))
	if absf(a) <= 45.0: animated_sprite.play(&"face_up")
	elif absf(a) >= 135.0: animated_sprite.play(&"face_down")
	elif a > 45.0 and a < 135.0: animated_sprite.play(&"face_right")
	elif a < -45.0 and a > -135.0: animated_sprite.play(&"face_left")


func disable_collision():
	for ci in get_child_count():
		var c = get_child(ci)
		if c is CollisionShape2D:
			c.disabled = true


func enable_collision():
	for ci in get_child_count():
		var c = get_child(ci)
		if c is CollisionShape2D:
			c.disabled = false
