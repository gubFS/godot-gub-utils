extends Resource
class_name ValueProperty

var value : Variant:
	set(value_):
		value = value_
		_emit_changed()

var next_connection_id: int = 0
var connections: Dictionary[int, Array] = {}

@warning_ignore("untyped_declaration") 
func _init(value_ = null) -> void:
	value = value_ 

func get_value() -> Variant:
	return value

func _add_connection(...callables: Array) -> int:
	var connection_id: int = next_connection_id
	next_connection_id += 1
	connections[connection_id] = callables
	return connection_id

## Calls the callable with the value as a parameter, whenever the value is changed. 
## Also calls it immdeiatly in order to initialize the state. Use the changed signal if unwanted.
func on_changed(callable : Callable) -> int:
	changed.connect(callable)
	callable.call(value)
	return _add_connection(callable)

## Whenever this property changes call callable, but disconnect bidirectional_signal first. Whenever bidirectional_signal emits, call bidirectional_callable, but disconnect this property first.
## Callable will have the new value passed as an argument, and bidirectional_callable will have whatever arguments bidirectional_signal emitted with.
func on_changed_bidirectional(callable: Callable, bidirectional_signal: Signal, bidirectional_callable: Callable) -> int:
	# Don't mind the hackyness here, surely theres gotta be a better way?
	var box: ValueBox = ValueBox.new()
	
	callable = func(value_: Variant) -> void:
		bidirectional_signal.disconnect(box.get_value())
		callable.call(value_)
		bidirectional_signal.connect(box.get_value())
	
	bidirectional_callable = func(...args: Array) -> void:
		changed.disconnect(callable)
		bidirectional_callable.callv(args)
		changed.connect(callable)
	box.set_value(bidirectional_callable)

	bidirectional_signal.connect(bidirectional_callable)
	var connection_id: int = on_changed(callable)
	connections[connection_id].append(bidirectional_callable)
	return connection_id

## Whenever the value changes, the given property on the given object will also be set to the value.
func bind(obj: Object, property: String) -> int:
	var bind_callable: Callable = func(value_: Variant) -> void:
		obj.set(property, value_)
	return on_changed(bind_callable)

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
func bind_bidirectional(obj: Object, property: String, on_set_signal: Signal) -> int:
	var bind_callable: Callable = func(value_: Variant) -> void:
		obj.set(property, value_)
	
	var bidirectional_callable: Callable = func(property_name: StringName, property_value: Variant) -> void:
		if property_name == property:
			value = property_value

	return on_changed_bidirectional(bind_callable, on_set_signal, bidirectional_callable)

func remove_connection(connection_id: int) -> void:
	for callable: Callable in connections[connection_id]:
		changed.disconnect(callable)

func _to_string() -> String:
	return str(value)

func _emit_changed() -> void:
	changed.emit(value)
