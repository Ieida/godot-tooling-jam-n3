class_name ElementalEssenceWater extends ElementalEssence


@export var amplitude: float = 1.0
@export var frequency: float = 0.2


func attract(to: Vector2, force: float):
	super(to, force)
	var d = global_position.direction_to(to)
	var s = sin(global_position.distance_to(to) * frequency) * amplitude
	var v = d * force
	v += d.orthogonal() * s * force
	global_position += v
