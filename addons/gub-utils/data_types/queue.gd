extends Object
class_name Queue

var _elements : Array[Variant] = []

func enqueue(element : Variant) -> void:
	_elements.push_back(element)

## Synonym for enqueue
func push(element : Variant) -> void:
	enqueue(element)


func dequeue() -> Variant:
	return _elements.pop_front()

## Synonym for dequeue
func pop() -> Variant:
	return dequeue()

## Returns null if empty
func front() -> Variant:
	if(_elements.is_empty()):
		return null
	
	return _elements.front()

## Synonym for front
func peek() -> Variant:
	return front()

func clear() -> void:
	_elements.clear()

func size() -> int:
	return _elements.size()

func is_empty() -> bool:
	return _elements.is_empty()

func _to_string() -> String:
	return str(_elements)
