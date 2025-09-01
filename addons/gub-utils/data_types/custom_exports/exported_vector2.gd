@tool
extends ExportedSelectOneOption
class_name ExportedVector2

func _set_options() -> void:
	options = {
		"ZERO" : Vector2.ZERO,
		"UP" : Vector2.UP,
		"LEFT" : Vector2.LEFT,
		"DOWN" : Vector2.DOWN,
		"RIGHT" : Vector2.RIGHT,
		"DOWN_LEFT" : Vector2(-1.0, 1.0),
		"DOWN_RIGHT" : Vector2(1.0, 1.0),
		"UP_LEFT" : Vector2(-1.0, -1.0),
		"UP_RIGHT" : Vector2(1.0, -1.0),
	}

func get_selected() -> Vector2:
	return selected as Vector2
