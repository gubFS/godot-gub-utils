class_name Task
extends RefCounted

signal on_any
signal on_all
var on_all_counter: int = 0

static func from() -> Task:
	return Task.new()

func when_any(...signals: Array) -> Signal:
	for signal_: Signal in signals:
		var callable: Callable = func() -> void: on_any.emit()
		signal_.connect(callable)
		on_any.connect(func() -> void: signal_.disconnect(callable))

	return on_any

func when_all(...signals: Array) -> Signal:
	on_all_counter = signals.size()
	for signal_: Signal in signals:
		var callable: Callable = func() -> void: 
			on_all_counter -= 1
			if on_all_counter == 0:
				on_all.emit()
		signal_.connect(callable, CONNECT_ONE_SHOT)

	return on_all

