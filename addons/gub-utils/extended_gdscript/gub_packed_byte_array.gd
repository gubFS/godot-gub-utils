class_name GubPackedByteArray
extends RefCounted

var bytes: PackedByteArray
var pointer: int = 0

func _init(bytes_: PackedByteArray = []) -> void:
	bytes = bytes_
	pointer = bytes.size()

func store_8(value: int) -> void:
	bytes.encode_s8(pointer, value)
	pointer += 1

func store_8s(value: int, amount: int) -> void:
	for i in amount:
		store_8(value)

func store_8_buffer(buffer: PackedByteArray) -> void:
	for value: int in buffer:
		store_8(value)

func store_8_buffer_fixed(buffer: PackedByteArray, length: int) -> void:
	buffer = buffer.duplicate()
	buffer.resize(length)
	store_8_buffer(buffer)

func store_32(value: int) -> void:
	bytes.encode_s32(pointer, value)
	pointer += 4

func store_32s(value: int, amount: int) -> void:
	for i in amount:
		store_32(value)

func store_32_buffer(buffer: PackedInt32Array) -> void:
	for value: int in buffer:
		store_32(value)

func store_float(value: float) -> void:
	bytes.encode_float(pointer, value)
	pointer += 4

func store_float_buffer(buffer: PackedFloat32Array) -> void:
	for value: float in buffer:
		store_float(value)

func store_float_buffer_fixed(buffer: PackedFloat32Array, length: int) -> void:
	buffer = buffer.duplicate()
	buffer.resize(length)
	store_float_buffer(buffer)

func store_vec3f(value: Vector3) -> void:
	for i in 3:
		store_float(value[i])

func store_vec3f_buffer(buffer: PackedVector3Array) -> void:
	for value: Vector3 in buffer:
		store_vec3f(value)

func store_vec3i32(value: Vector3i) -> void:
	for i in 3:
		store_32(value[i])

func store_string(value: String) -> void:
	store_8_buffer(value.to_ascii_buffer())

func store_string_fixed(value: String, length: int) -> void:
	var ascii: PackedByteArray = value.to_ascii_buffer()
	ascii.resize(length)
	store_8_buffer(ascii)

func append(value: int) -> bool:
	return bytes.append(value)

func resize(new_size: int) -> int:
	return bytes.resize(new_size)
	
func add_size(size_to_add: int) -> int:
	return resize(bytes.size() + size_to_add)
