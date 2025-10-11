extends Resource
class_name ValueProperty

var value : Variant:
	set(value_):
		value = value_
		_emit_changed()

@warning_ignore("untyped_declaration") func _init(value_ = null) -> void:
	self.value = value_ 

func get_value() -> Variant:
	return value

## Calls the callable with the value as a parameter, whenever the value is changed. 
### Also calls it immdeiatly in order to initialize the state. Use the changed signal if unwanted.
func on_changed(callable : Callable) -> void:
	changed.connect(callable)
	callable.call(value)

## Whenever the value changes, the given property on the given object will also be set to the value.
func bind(obj: Object, property: String) -> void:
	var bind_callable: Callable = func(value: Variant) -> void:
		obj.set(property, value)
	on_changed(bind_callable)

## Whenever either the ValueProperty or the property of the object is changed, they both match to equal eachother.
## A signal that emits whenever a property is changed, must be passed. The singal should emit like so: ``_on_set.emit(property_name: StringName, property_value: Variant)``
## For inherited variables override the _set() method like so: ```
## signal _on_set
## func _set(property: StringName, value: Variant) -> bool:
## 	_on_set.emit(property, value)
## 	return false
## ```
## And for variables within the class emit the signal, in a custom setter. (remember to also set the value)
## If changing a inherited variable from whithin the class, it will not call _set(), use self.my_var to use _set(), and emit the signal properly.
func bind_bidirectional(obj: Object, property: String, on_set_signal: Signal) -> void:
	# Don't mind the hackyness here, there must be a better way, right?
	var bind_box: ValueBox = ValueBox.new()

	var bind_callable: Callable = func(value: Variant) -> void:
		on_set_signal.disconnect(bind_box.value)
		obj.set(property, value)
		on_set_signal.connect(bind_box.value)
	
	var bidirectional_callable: Callable = func(property_name: StringName, property_value: Variant) -> void:
		if property_name == property:
			changed.disconnect(bind_callable)
			value = property_value
			changed.connect(bind_callable)
	bind_box.set_value(bidirectional_callable)

	on_set_signal.connect(bidirectional_callable)
	on_changed(bind_callable)
	

func _to_string() -> String:
	return str(value)

func _emit_changed() -> void:
	changed.emit(value)
