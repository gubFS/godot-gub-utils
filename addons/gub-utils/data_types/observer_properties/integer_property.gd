extends ValueProperty
class_name IntegerProperty

var min_value : int
var max_value : int

func _init(value_ : int = 0, min_value_ : int = INT.MIN, max_value_ : int = INT.MAX) -> void:
	super(value_)
	value = value as int
	
	min_value = min_value_
	max_value = max_value_
	
	on_changed(_limit_value)

func _limit_value(_value : int) -> void:
	if(value < min_value):
		value = min_value
	elif(value > max_value):
		value = max_value
