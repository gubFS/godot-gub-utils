extends Object
class_name GubNode

static func swap_out(what : Node, for_what : Node) -> void:
	var parent : Node = what.get_parent()
	parent.add_child(for_what)
	parent.move_child(for_what, parent.get_children().find(what))
	what.queue_free()
