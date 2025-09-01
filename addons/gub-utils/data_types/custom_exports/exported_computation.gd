@tool
extends ExportedSelectOneOption
class_name ExportedComputation

func _set_options() -> void:
	options = {
		"ADD" : AddComputation.new(),
		"SUBTRACT" : SubtractComputation.new(),
		"MULTIPLY" : MultiplyComputation.new(),
		"DIVISION" : DivisionComputation.new(),
	}

func get_selected() -> Computation:
	return selected as Computation
