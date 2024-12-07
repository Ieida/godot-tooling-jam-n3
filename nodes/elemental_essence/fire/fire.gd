class_name ElementalEssenceFire extends ElementalEssence


func attract(to: Vector2, force: float):
	super(to, force)
	var d = global_position.direction_to(to)
	var v = d * force
	var rd = Vector2.RIGHT.rotated(randf() * 360.0)
	v += rd
	global_position += v
