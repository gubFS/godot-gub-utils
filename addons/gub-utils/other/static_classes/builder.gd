class_name Builder
extends Object

## Calls the builder callable with value given as parameter and returns the value. Can be used in daisy-chaining.
static func build(value: Variant, builder: Callable) -> Variant:
	builder.call(value)
	return value
