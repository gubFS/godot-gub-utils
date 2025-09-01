@tool
extends RichTextEffect
class_name RichTextSplit

# Syntax: [split col1=white col2=grey idx=4][/split]

var idx : IntegerProperty
var bbcode : String = "split"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var col1 : Color = char_fx.env.get("col1", Color.WHITE)
	var col2 : Color = char_fx.env.get("col2", Color.GRAY)
	var split_idx : int = char_fx.env.get("idx", idx.value)
	
	if(char_fx.relative_index < split_idx):
		char_fx.color = col1
	else:
		char_fx.color = col2
	
	# 4 == space
	if(char_fx.relative_index < split_idx - 1 && char_fx.glyph_index == 7):
		char_fx.visible = false
	
	return true
