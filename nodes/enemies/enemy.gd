class_name Enemy extends CharacterBody2D


@export var speed: float
@export var animated_sprite: AnimatedSprite2D
@export var player: Player


func _physics_process(delta):
	if player: chase()


func chase():
	var d = global_position.direction_to(player.global_position)
	velocity = d * speed
	move_and_slide()
	
	var a = rad_to_deg(Vector2.UP.angle_to(d))
	if absf(a) <= 45.0: animated_sprite.play(&"face_up")
	elif absf(a) >= 135.0: animated_sprite.play(&"face_down")
	elif a > 45.0 and a < 135.0: animated_sprite.play(&"face_right")
	elif a < -45.0 and a > -135.0: animated_sprite.play(&"face_left")
