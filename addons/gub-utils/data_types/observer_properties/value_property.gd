extends Resource
class_name ValueProperty

var value : Variant:
	set(value_):
		value = value_
		changed.emit(value)

@warning_ignore("untyped_declaration") func _init(value_ = null) -> void:
	self.value = value_ 

## Calls the callable with the value as a parameter, whenever the value is changed. 
### Also calls it immdeiatly in order to initialize the state. Use the changed signal if unwanted.
func on_changed(callable : Callable) -> void:
	changed.connect(callable)
	callable.call(value)

## Whenever the value changes, the given property on the given object will also be set to the value.
func bind(obj: Object, property: String) -> void:
	on_changed(func(value: Variant) -> void:
		obj.set(property, value)
	)

func _to_string() -> String:
	return str(value)
