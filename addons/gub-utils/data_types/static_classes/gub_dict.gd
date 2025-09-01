extends Object
class_name GubDict

static func replace(dict : Dictionary, key : String, value : Variant) -> void:
	dict.erase(key)
	dict.get_or_add(key, value)
