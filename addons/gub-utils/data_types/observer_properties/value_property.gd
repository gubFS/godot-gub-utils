extends Resource
class_name ValueProperty

var value : Variant:
	set(value_):
		value = value_
		changed.emit(value)
		
@warning_ignore("untyped_declaration") func _init(value_ = null) -> void:
	self.value = value_ 
	
func on_changed(callable : Callable) -> void:
	changed.connect(callable)
	callable.call(value)
	
func _to_string() -> String:
	return str(value)
