class_name CollisionMesh3D
extends CollisionShape3D

@export var mesh: Mesh:
	set(value):
		mesh = value
		_create_shape()

func _create_shape() -> void:
	if mesh != null:
		shape = mesh.create_convex_shape()
