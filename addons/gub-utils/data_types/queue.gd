extends Object
class_name Queue

var _elements : Array[Variant] = []

func add(element : Variant) -> void:
	_elements.push_back(element)

func take() -> Variant:
	return _elements.pop_front()

func peek() -> Variant:
	if(_elements.is_empty()):
		return null
	
	return _elements.front()
