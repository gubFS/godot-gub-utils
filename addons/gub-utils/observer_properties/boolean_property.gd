extends ValueProperty
class_name BooleanProperty

func _init(my_bool : bool) -> void:
	super(my_bool)

func get_value() -> bool:
	return value
