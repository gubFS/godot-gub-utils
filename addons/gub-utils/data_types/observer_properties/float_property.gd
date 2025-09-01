extends ValueProperty
class_name FloatProperty

var min_value : float
var max_value : float
var string_precision : int # -1 for no value

func _init(value_ : float = 0.0, min_value_ : float = FLOAT.MIN, max_value_ : float = FLOAT.MAX, string_precision_ : int = 2) -> void:
	super(value_)
	value = value as float
	
	min_value = min_value_
	max_value = max_value_
	string_precision = string_precision_
	
	on_changed(_limit_value)

func _to_string() -> String:
	var decimal_precision : String = "." + str(string_precision)
	if(decimal_precision == "-1"):
		decimal_precision = ""
	
	var format : String = "%" + decimal_precision + "f"
	return format % value

func _limit_value(_value : float) -> void:
	if(value < min_value):
		value = min_value
	elif(value > max_value):
		value = max_value
