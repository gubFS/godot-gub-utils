class_name FileType
extends RefCounted

enum FileTypes{
	UNKNOWN = 0,
	
	JPG,
	JPEG,
	PNG,
	TGA,
	SVG,
	
	STL,
	OBJ,
	BLEND,
	GLTF,
	GLB,
	
	TXT,
	XML,
	CFG,
}

const UNKNOWN: FileTypes = FileTypes.UNKNOWN

const JPG: FileTypes = FileTypes.JPG
const JPEG: FileTypes = FileTypes.JPEG
const PNG: FileTypes = FileTypes.PNG
const TGA: FileTypes = FileTypes.TGA
const SVG: FileTypes = FileTypes.SVG

const STL: FileTypes = FileTypes.STL
const OBJ: FileTypes = FileTypes.OBJ
const BLEND: FileTypes = FileTypes.BLEND
const GLTF: FileTypes = FileTypes.GLTF
const GLB: FileTypes = FileTypes.GLB

const TXT: FileTypes = FileTypes.TXT
const XML: FileTypes = FileTypes.XML
const CFG: FileTypes = FileTypes.CFG

const extenstions_map: Dictionary[String, FileTypes] = {
	".jpg" = JPEG,
	".jpeg" = JPEG,
	".png" = PNG,
	".tga" = TGA,
	".svg" = SVG,
	
	".stl" = STL,
	".obj" = OBJ,
	".blend" = BLEND,
	".gltf" = GLTF,
	".glb" = GLB,
	
	".txt" = TXT,
	".xml" = XML,
	".cfg" = CFG,
}

const image_file_types: Array[FileTypes] = [
	JPEG,
	PNG,
	TGA,
	SVG,
]

const model_file_types: Array[FileTypes] = [
	STL,
	OBJ,
	BLEND,
	GLTF,
	GLB,
]

const text_file_types: Array[FileTypes] = [
	TXT,
	XML,
	CFG,
]

static func get_file_type(filename: String) -> FileTypes:
	var result: Variant = extenstions_map.get(GubString.get_extension_with_period(filename))
	if result == null:
		return UNKNOWN
	return result as FileTypes

static func is_model(file_type: FileTypes) -> bool:
	return model_file_types.has(file_type)
