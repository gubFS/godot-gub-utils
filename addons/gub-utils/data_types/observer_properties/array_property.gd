class_name ArrayProperty
extends ValueProperty

var array: Array:
	get():
		return value
	set(value_):
		value = value_

func _init(value_ : Array = []) -> void:
	super(value_)

func append(...values: Array) -> void:
	array.append_array(values)
	_emit_changed()

func erase(...values: Array) -> void:
	for value_: Variant in values:
		array.erase(value_)
	_emit_changed()

func clear() -> void:
	array.clear()
	_emit_changed()
