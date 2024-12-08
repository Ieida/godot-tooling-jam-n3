class_name ElementalEnemy extends Enemy


@export var essense_spawner: ElementalEssenceSpawner


func die():
	super()
	essense_spawner.spawn()
