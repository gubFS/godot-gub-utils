class_name TestRunner
extends Node

func _ready() -> void:
	GubDirAccess.traverse_files_recursive("res://tests", func(dir: DirAccess, filename: String) -> void:
		if filename.get_extension() != "gd": return
		var script: Script = load(dir.get_current_dir() + "/" + filename)
		if !script.can_instantiate(): return
		var instance: Variant = script.new()
		if !(instance is Test): return
		instance = instance as Test

		instance.run_test()
	)
