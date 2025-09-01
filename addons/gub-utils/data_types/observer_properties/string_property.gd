extends ValueProperty
class_name StringProperty

func _init(value_ : String = "") -> void:
	super(value_)
	value = value as String

func get_value() -> String:
	return value as String

func _to_string() -> String:
	return value as String
