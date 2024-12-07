class_name EnemyAttackExplode extends EnemyAttack


@export var area: Area2D
@onready var hint: MeshInstance2D = $Hint


func _on_anim_finished():
	enemy.queue_free()


func _ready():
	hint.hide()
	hint.reparent.call_deferred(enemy, false)


func attack():
	super()
	hint.show()
	enemy.is_alive = false
	enemy.animated_sprite.play(&"explode")
	enemy.animated_sprite.animation_finished.connect(_on_anim_finished, CONNECT_ONE_SHOT)
	deal_damage()


func deal_damage():
	var ars = area.get_overlapping_areas()
	for a in ars:
		if a is Hitbox:
			a.damage(damage)
