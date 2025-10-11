extends Object
class_name GubNode

static func swap_out(what : Node, for_what : Node) -> void:
	var parent : Node = what.get_parent()
	parent.add_child(for_what)
	parent.move_child(for_what, parent.get_children().find(what))
	parent.remove_child(what)
	what.queue_free()

static func remove_children(parent: Node) -> void:
	var children: Array[Node] = parent.get_children()
	for child: Node in children:
		parent.remove_child(child)
		child.queue_free()

## Can be used to create a scene tree from code, for example:
##	var root = GubNode.add_child(Node3D.new(), [
##		GubNode.construct(MeshInstance3D.new(), func(mesh_instance_3d: MeshInstance3D) -> MeshInstance3D:
##			mesh_instance_3d.mesh = mesh
##		),
##		GubNode.add_child(StaticBody3D.new(), [
##			CollisionShape3D.new()
##		])
##	])
static func add_child(parent: Node, children: Array[Node]) -> Node:
	for child: Node in children:
		parent.add_child(child)
	
	return parent

static func print_node_tree(node: Node) -> void:
	print(node.get_class())
	traverse_children(node, func(child: Node, depth: int) -> void:
		var s: String = ""
		for i in depth:
			s += "\t"
		s += child.get_class()
		print(s)
	, 1)

static func traverse_children(node: Node, callable: Callable, depth: int = 0) -> void:
	for child: Node in node.get_children():
		callable.call(child, depth)
		traverse_children(child, callable, depth + 1)
