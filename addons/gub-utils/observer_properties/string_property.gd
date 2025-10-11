extends ValueProperty
class_name StringProperty

func _init(value_ : String = "") -> void:
	super(value_)

func get_value() -> String:
	return value
