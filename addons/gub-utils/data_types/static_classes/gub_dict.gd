class_name GubDict
extends RefCounted

var dict: Dictionary

func _init(dict_: Dictionary = {}) -> void:
	dict = dict_

func assign_try(object: Object, property: String, key: String = property) -> bool:
	return assign_try_static(dict, object, property, key)

static func assign_try_static(dict: Dictionary, object: Object, property: String, key: String) -> bool:
	if dict.has(key):
		object.set(property, dict.get(key))
		return true
	return false

static func replace(dict : Dictionary, key : String, value : Variant) -> void:
	dict.erase(key)
	dict.get_or_add(key, value)
