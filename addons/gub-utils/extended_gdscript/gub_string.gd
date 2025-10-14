extends Object
class_name GubString

static func remove_last(s : String) -> String:
	if(s.length() == 0):
		return s
	return s.erase(s.length() - 1)

static func sub_string(s : String, from : int, to : int) -> String:
	return s.substr(from, to - from)

static func remove_extension(s: String) -> String:
	return s.left(-(s.get_extension().length()+1))

static func replace_extension(s: String, new_extension: String) -> String:
	s = remove_extension(s)
	s += "." + new_extension
	return s

## retuns "" if there is no extension
static func get_extension_with_period(s: String) -> String:
	var extension: String = s.get_extension()
	if extension != "":
		extension = "." + extension
	return extension

static func remove_trailing_whitespace(s: String) -> String:
	while !s.is_empty() && s.right(1) in ["\n", "\t", " "]:
		s = remove_last(s)
	return s
