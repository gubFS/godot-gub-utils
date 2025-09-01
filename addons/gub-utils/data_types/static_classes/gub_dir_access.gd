class_name GubDirAccess
extends Object

# returns the path to the first file with the given name in any subdirectory
static func file_exists_recursive(dir_path: String, filename: String) -> String:
	var my_dir: DirAccess = DirAccess.open(dir_path)
	if my_dir.file_exists(filename):
		return my_dir.get_current_dir() + "/" + filename
	for dir: String in my_dir.get_directories():
		var file: String = file_exists_recursive(my_dir.get_current_dir() + "/" + dir, filename)
		if file != "":
			return file
	return ""
