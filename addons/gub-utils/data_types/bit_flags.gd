class_name BitFlags
extends RefCounted

var flags_property: IntegerProperty
var flags: int:
	get():
		return flags_property.value
	set(value):
		flags_property.value = value

func _init(flags_: int = 0) -> void:
	flags_property = IntegerProperty.new(flags_)

static func from(flags_: int = 0) -> BitFlags:
	return BitFlags.new(flags_)

func set_flags_to_raw(mask: int, value: bool) -> BitFlags:
	flags = set_flags_to_raw_static(flags, mask, value)
	return self

static func set_flags_to_raw_static(flags: int, mask: int, value: bool) -> int:
	if value:
		flags |= mask
	else:
		flags &= ~mask
	
	return flags

func set_flags_raw(mask: int) -> BitFlags:
	return set_flags_to_raw(mask, true)

func unset_flags_raw(mask: int) -> BitFlags:
	return set_flags_to_raw(mask, false)

func set_flag_to(idx: int, value: bool) -> BitFlags:
	if(idx >= 32):
		push_error("Index " + str(idx) + " is out of flag range")
	
	var mask: int = 1 << idx
	
	return set_flags_to_raw(mask, value)

## Dictionary{idx(int): value(bool)}
func set_many_to(flags_: Array[Dictionary]) -> BitFlags: 
	var to_set: PackedInt64Array = []
	var to_unset: PackedInt64Array = []
	for flag: Dictionary in flags_:
		if flag.values()[0]:
			to_set.append(flag.keys()[0])
		else:
			to_unset.append(flag.keys()[0])
	
	set_many(to_set)
	unset_many(to_unset)
	
	return self

func _set_many_to(flags_: Array[int], value: bool) -> BitFlags:
	flags = _set_many_to_static(flags, flags_, value)
	return self

static func _set_many_to_static(flags, flags_: Array[int], value: bool) -> int:
	var mask: int = 0
	for idx: int in flags_:
		mask |= 1 << idx
	return set_flags_to_raw_static(flags, mask, value)

func set_flag(flag: int) -> BitFlags:
	return set_flag_to(flag, true)

func set_many(flags_: PackedInt64Array) -> BitFlags:
	return _set_many_to(flags_, true)

func unset_flag(flag: int) -> BitFlags:
	return set_flag_to(flag, false)

func unset_many(flags_: PackedInt64Array) -> BitFlags:
	flags = unset_many_static(flags, flags_)
	return self

static func unset_many_static(flags: int, flags_: PackedInt64Array) -> int:
	return _set_many_to_static(flags, flags_, false)

func toggle_flag(flag: int) -> BitFlags:
	return set_flag_to(flag, !get_flag(flag))

func get_flag(idx: int) -> bool:
	return flags & (1 << idx)

static func make_flags(flags_: PackedInt64Array) -> int:
	var flags: int = 0
	for idx: int in flags_:
		flags |= 1 << idx
	return flags
