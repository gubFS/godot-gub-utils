class_name Stack
extends RefCounted

var arr: Array = []

func push(element: Variant) -> void:
	arr.push_back(element)

func pop() -> Variant:
	if is_empty(): return null
	return arr.pop_back()

func peek() -> Variant:
	if is_empty(): return null
	return arr.back()

func get_element(idx: int) -> Variant:
	if is_empty(): return null
	var actual_idx: int = size() - 1 - idx
	if actual_idx < 0: return null
	return arr[actual_idx]

func is_empty() -> bool:
	return arr.is_empty()

func size() -> int:
	return arr.size()
