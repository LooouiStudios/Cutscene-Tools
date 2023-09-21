extends GEGraphNode

func _ready():
	title = "Choice Option"
	rect_min_size = Vector2(12 * 24, 4 * 24)
	show_close = true
	set_slot(0, true, 0, Color.white, true, 0, Color.white)
	
	var option = TextEdit.new()
	option.wrap_enabled = true
	var property_editor_text = _add_property("option", option)
	property_editor_text.set_bottom_editor(option)
	option.rect_min_size.y = 48
