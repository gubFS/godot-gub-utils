extends Object
class_name GubString

static func remove_last(s : String) -> String:
	if(s.length() == 0):
		return s
	return s.erase(s.length() - 1)

static func sub_string(s : String, from : int, to : int) -> String:
	return s.substr(from, to - from)

static func replace_extension(s: String, new_extension: String) -> String:
	s = s.left(-(s.get_extension().length()+1))
	s += "." + new_extension
	return s
