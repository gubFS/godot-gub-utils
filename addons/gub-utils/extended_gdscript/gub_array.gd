class_name GubArray
extends RefCounted

static func has_any(arr: Array, any_array: Array) -> bool:
	for value: Variant in arr:
		if value in any_array: 
			return true
	return false

static func erase(arr: Array, value: Variant) -> Variant:
	var idx: int = arr.find(value)
	if idx == -1: return null
	return arr.pop_at(idx)

static func erase_many(arr: Array, values: Array) -> Array:
	var removed_values: Array = []
	for value: Variant in values:
		var removed_value: Variant = erase(arr, value)
		if removed_value != null:
			removed_values.append(removed_value)
	return removed_values
