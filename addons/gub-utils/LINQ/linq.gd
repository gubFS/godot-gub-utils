class_name LINQ
extends RefCounted

var arr: Array

func _init(arr_: Array = []) -> void:
	arr = arr_

func to_array() -> Array:
	return arr

static func from(arr_: Array) -> LINQ:
	return LINQ.new(arr_)

func for_each(callable: Callable) -> LINQ:
	for item: Variant in arr:
		callable.call(item)
	return self

func for_each_i(callable: Callable) -> LINQ:
	for i: int in arr.size():
		var item: Variant = arr[i]
		callable.call(item, i)
	return self

func where(comparitor: Callable) -> LINQ:
	var new_arr: Array = []
	for item: Variant in arr:
		if comparitor.call(item):
			new_arr.append(item)
	arr = new_arr
	return self

func first_or_default(comparitor: Callable, default: Variant = null) -> Variant:
	for item: Variant in arr:
		if comparitor.call(item):
			return item
	return default
