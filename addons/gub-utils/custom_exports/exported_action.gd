@tool
extends ExportedSelectOneOption
class_name ExportedAction

func _set_options() -> void:
	InputMap.load_from_project_settings()
	for action : StringName in InputMap.get_actions():
		options.get_or_add(action, action)

func get_selected() -> String:
	return selected as String
