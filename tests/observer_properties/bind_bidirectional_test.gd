extends Test

func run_test() -> void:
	var test_class: TestClass = TestClass.new()
	
	test_class.my_vec = Vector3(123,1243,43321)
	assert(test_class.my_vec == Vector3(123,1243,43321))
	assert(test_class.my_vec_property.value == Vector3(123,1243,43321))

	test_class.my_vec_property.value = Vector3(435,541,12)
	assert(test_class.my_vec == Vector3(435,541,12))
	assert(test_class.my_vec_property.value == Vector3(435,541,12))

class TestClass:
	extends Node3D

	var my_vec: Vector3 = Vector3.ONE:
		set(value):
			my_vec = value
			_on_set.emit("my_vec", value)
	var my_vec_property: Vector3Property = Vector3Property.new()

	func _init() -> void:
		my_vec_property.bind_bidirectional(self, "my_vec", _on_set)

	signal _on_set
	func _set(property: StringName, value: Variant) -> bool:
		print("setting")
		_on_set.emit(property, value)
		return false
