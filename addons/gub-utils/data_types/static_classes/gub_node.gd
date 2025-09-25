extends Object
class_name GubNode

static func swap_out(what : Node, for_what : Node) -> void:
	var parent : Node = what.get_parent()
	parent.add_child(for_what)
	parent.move_child(for_what, parent.get_children().find(what))
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

## Calls the constructor with node given as parameter and returns the node. Can be used in daisy-chaining.
static func construct(node: Node, constructor: Callable) -> Node:
	constructor.call(node)
	return node
