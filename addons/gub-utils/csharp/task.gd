class_name Task
extends RefCounted


class TaskWhenAny:
	signal on_any
	func when_any(signals: Array) -> void:
		for signal_: Signal in signals:
			var callable: Callable = func() -> void: on_any.emit()
			signal_.connect(callable)
			on_any.connect(func() -> void: signal_.disconnect(callable))

		await on_any

static func when_any(signals: Array) -> void:
	var task: TaskWhenAny = TaskWhenAny.new()
	await task.when_any(signals)

class TaskWhenAll:
	signal on_all
	var on_all_counter: int = 0
	func when_all(signals: Array) -> void:
		on_all_counter = signals.size()
		for signal_: Signal in signals:
			var callable: Callable = func() -> void: 
				on_all_counter -= 1
				if on_all_counter == 0:
					on_all.emit()
			signal_.connect(callable, CONNECT_ONE_SHOT)

		await on_all

static func when_all(signals: Array[Signal]) -> void:
	var task: TaskWhenAll = TaskWhenAll.new()
	await task.when_all(signals)
