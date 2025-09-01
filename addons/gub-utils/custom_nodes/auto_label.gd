extends Label
class_name AutoLabel

@export var property : ValueProperty:
	set(value):
		property = value
		property.on_changed(update_label)
@export var prefix : String
@export var suffix : String

func update_label(_value : Variant) -> void:
	text = prefix + str(property) + suffix
