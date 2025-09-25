class_name Set
extends RefCounted

var _set: Array[Variant] = []

func values() -> Array[Variant]:
	return _set

## Callable is a method that returns true if the parameter, and the object is equal
func add(value: Variant, comparison: Callable = func(value: Variant, compare_value: Variant) -> bool: return value == compare_value) -> void:
	for compare_value: Variant in _set:
		if comparison.call(value, compare_value):
			return
	
	_set.append(value)

func clear() -> void:
	_set.clear()

func size() -> int:
	return values().size()

func get_value(idx: int) -> Variant:
	return values()[idx]

func get_idx(value: Variant) -> int:
	return values().find(value)

func has(value: Variant) -> bool:
	return _set.has(value)
