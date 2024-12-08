class_name Player extends CharacterBody2D


@export var speed: float = 64.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox
@onready var health_bar: ProgressBar = $UI/HealthBar
var is_alive: bool = true


func _on_health_reached_zero():
	is_alive = false
	animated_sprite.play(&"die")
	await get_tree().create_timer(3.0).timeout
	get_tree().reload_current_scene()


func _on_hitbox_damaged():
	health_bar.value = hitbox.get_health_percentage() * 100.0


func _physics_process(_delta):
	if is_alive: move()


func _ready():
	hitbox.damaged.connect(_on_hitbox_damaged)
	hitbox.health_reached_zero.connect(_on_health_reached_zero)
	health_bar.value = hitbox.get_health_percentage() * 100.0


func damage(amt: float):
	hitbox.damage(amt)


func move():
	var direction = Input.get_vector(&"move_left", &"move_right", &"move_up", &"move_down")
	if direction:
		velocity = direction * speed
		var a = rad_to_deg(Vector2.UP.angle_to(direction))
		if absf(a) < 45.0: animated_sprite.play(&"face_up")
		elif absf(a) > 135.0: animated_sprite.play(&"face_down")
		elif a > 45.0 and a < 135.0: animated_sprite.play(&"face_right")
		elif a < -45.0 and a > -135.0: animated_sprite.play(&"face_left")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
	move_and_slide()
