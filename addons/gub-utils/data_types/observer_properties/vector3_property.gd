class_name Vector3Property
extends ValueProperty

func _init(x: float = 0, y: float = 0, z: float = 0) -> void:
	super(Vector3(x, y, z))
	value = value as Vector3

func get_value() -> Vector3:
	return value as Vector3

static func from_vec(vec: Vector3) -> Vector3Property:
	return Vector3Property.new(vec.x, vec.y, vec.z)

static func from_dict(dict: Dictionary) -> Vector3Property:
	return Vector3Property.new(dict.x, dict.y, dict.z)

func _get_dict() -> Dictionary:
	return {
		"x": value.x,
		"y": value.y,
		"z": value.z,
	}
