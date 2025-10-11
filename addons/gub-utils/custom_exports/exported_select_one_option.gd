@tool
extends Resource
class_name ExportedSelectOneOption

var options : Dictionary
var _option : String:
	set(value):
		_option = value
		selected = options.get(_option)
var selected : Variant

func _init(my_options : Dictionary = {}) -> void:
	if(my_options.is_empty()):
		_set_options()
	else:
		options = my_options
	
	if(!options.is_empty()):
		_option = options.keys()[0]

func _get_property_list() -> Array[Dictionary]:
	var properties : Array[Dictionary] = []
	
	var options_string : String = ""
	for key : String in options.keys():
		options_string += key + ","
	options_string = GubString.remove_last(options_string)
	
	properties.append({
		"name": "_option",
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": options_string, 
	})
	
	return properties
	
func _set_options() -> void:
	assert(false, "Abstract method")
