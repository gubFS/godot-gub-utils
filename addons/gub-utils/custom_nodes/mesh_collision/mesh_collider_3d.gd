class_name MeshCollider3D
extends MeshInstance3D

var collision_mesh_3d: CollisionMesh3D = null

func _ready() -> void:
	collision_mesh_3d = Builder.build(CollisionMesh3D.new(), func(node: CollisionMesh3D) -> void:
		node.mesh = mesh
	)
	
	add_child(
		GubNode.add_child(StaticBody3D.new(), [
			collision_mesh_3d,
	]))

func _set(name: StringName, value: Variant) -> bool:
	match name:
		"mesh":
			mesh = value
			if collision_mesh_3d != null:
				collision_mesh_3d.mesh = mesh
	return true
