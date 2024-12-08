class_name EnemyAttackExplode extends EnemyAttack


signal exploded


@export var area: Area2D
@export var essence_spawner: ElementalEssenceSpawner


func _on_anim_finished():
	enemy.queue_free()
	pass


func _ready():
	super()


func attack():
	super()
	enemy.is_alive = false
	enemy.animated_sprite.play(&"explode")
	enemy.animated_sprite.animation_finished.connect(_on_anim_finished, CONNECT_ONE_SHOT)
	essence_spawner.spawn()
	deal_damage()
	exploded.emit()


func deal_damage():
	var ars = area.get_overlapping_areas()
	for a in ars:
		if a is Hitbox and not enemy.is_ancestor_of(a):
			a.damage(damage)
