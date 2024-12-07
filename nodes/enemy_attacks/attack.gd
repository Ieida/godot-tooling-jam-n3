class_name EnemyAttack extends Node


@export var enemy: Enemy
@export var attack_range: float = 24.0
@export var damage: int = 100
var is_attacking: bool


func _physics_process(_delta):
	if not is_attacking and is_in_range(): attack()


func _ready():
	pass


func attack():
	is_attacking = true


func is_in_range() -> bool:
	return enemy.global_position.distance_to(enemy.player.global_position) <= attack_range
