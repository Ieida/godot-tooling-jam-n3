class_name Player extends CharacterBody2D


@export var speed: float = 64.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta):
	var direction = Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down")
	if direction:
		velocity = direction * speed
		if direction.y > 0.0: animated_sprite.play(&"face_down")
		elif direction.y < 0.0: animated_sprite.play(&"face_up")
		elif direction.x > 0.0: animated_sprite.play(&"face_right")
		elif direction.x < 0.0: animated_sprite.play(&"face_left")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)

	move_and_slide()
