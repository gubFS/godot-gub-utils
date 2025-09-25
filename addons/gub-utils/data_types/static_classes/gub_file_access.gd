class_name GubFileAccess
extends FileAccess

static func store_24(file: FileAccess, value: int) -> void:
	for i in 3:
		if !file.big_endian:
			file.store_8((value >> 8 * i) & 0xFF)
		else:
			file.store_8((value >> 8 * (2 - i)) & 0xFF)

static func store_8s(file: FileAccess, amount_in_bytes: int = 1, value: int = 0) -> void:
	for i in amount_in_bytes:
		file.store_8(value)

static func store_32s(file: FileAccess, amount_in_bytes: int = 1, value: int = 0) -> void:
	for i in amount_in_bytes:
		file.store_32(value)

# stores and returns
static func store_32_at(file: FileAccess, offset: int, value: int) -> void:
	var origin: int = file.get_position()
	file.seek(offset)
	file.store_32(value)
	file.seek(origin)

static func store_string_fixed(file: FileAccess, s: String, fixed_len: int, fill_value: int = 0) -> void:
	s = s.substr(0, fixed_len)
	file.store_string(s)
	var unused_spaces: int = fixed_len - s.length()
	GubFileAccess.store_8s(file, unused_spaces, fill_value)
