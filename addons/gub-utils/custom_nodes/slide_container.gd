extends MarginContainer
class_name SliderContainer

@export var start_open : bool = false
@export var time_to_slide : float = 0.25
@export var slide_in_direction : ExportedVector2 = ExportedVector2.new()
@export var on_action : ExportedAction

var is_open : BooleanProperty = BooleanProperty.new(false)
var _slide_tween : Tween

func _ready() -> void:
	if(!start_open):
		(func() -> void: position += size * slide_in_direction.get_selected() * -1).call_deferred()
	
	is_open.value = start_open

func _input(event: InputEvent) -> void:
	if(on_action != null && InputMap.get_actions().has(on_action.selected) && event.is_action_pressed(on_action.selected)):
		slide_tab()

func slide_tab() -> void:
	if(_slide_tween != null && _slide_tween.is_running()):
		return
	
	var amount : Vector2 = size * slide_in_direction.get_selected()
	if(is_open.value):
		amount *= -1

	_slide_tween = get_tree().create_tween()
	_slide_tween.tween_property(self, "position", position + amount, time_to_slide)
	
	is_open.value = !is_open.value
