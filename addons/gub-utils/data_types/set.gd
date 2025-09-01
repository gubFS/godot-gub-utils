class_name Set
extends RefCounted

var _set: Array[Variant] = []

func values() -> Array[Variant]:
	return _set

func add(value: Variant) -> void:
	if !_set.has(value):
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
