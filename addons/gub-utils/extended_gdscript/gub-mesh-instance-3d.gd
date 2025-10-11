class_name GubMeshInstance3D
extends Object

static func from_file(file_path: String) -> MeshInstance3D:
	var gltf_document_load: GLTFDocument = GLTFDocument.new()
	var gltf_state_load: GLTFState = GLTFState.new()
	var error: Error = gltf_document_load.append_from_file(file_path, gltf_state_load)
	var gltf_scene_root_node: Node
	if error == OK:
		gltf_scene_root_node = gltf_document_load.generate_scene(gltf_state_load)
	else:
		push_error("Couldn't load glTF scene (error code: %s)." % error_string(error))
		return null
	
	for child: Node in gltf_scene_root_node.get_children():
		if child is MeshInstance3D:
			return child
	return null
