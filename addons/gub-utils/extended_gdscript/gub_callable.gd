extends Object
class_name GubCallable

# doesnt really work on signals :/
static func bind_left(callable : Callable, arg : Variant) -> Callable:
	return func(args : Variant) -> void:
		callable.call(arg, args)
