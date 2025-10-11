class_name ValueBox
extends RefCounted

## A class that can be used to easily pass primitive types or objects as a refrence.

var value: Variant

func _init(value_: Variant = null) -> void:
	value = value_

func get_value() -> Variant:
	return value

func set_value(value_: Variant) -> void:
	value = value_
