@tool
class_name ToggleExternalEditor
extends EditorScript

func _run() -> void:
	var settings: EditorSettings = EditorInterface.get_editor_settings()
	var external_editor_setting_path: String = "text_editor/external/use_external_editor"
	var current_state: bool = settings.get_setting(external_editor_setting_path)
	settings.set_setting(external_editor_setting_path, !current_state)
	print("External editor is now turned " + ("on" if !current_state else "off") + ".")
