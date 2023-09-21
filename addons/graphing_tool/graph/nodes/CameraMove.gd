extends GEGraphNode

func _ready():
	title = "Move Camera"
	rect_min_size = Vector2(12 * 24, 3 * 24)
	show_close = true
	set_slot(0, true, 0, Color.white, true, 0, Color.white)
	
	var x = TextEdit.new()
	var property_editor_x = _add_property("x", x)
	property_editor_x.set_bottom_editor(x)
	x.rect_min_size.y = 24
	
	var y = TextEdit.new()
	var property_editor_y = _add_property("y", y)
	property_editor_y.set_bottom_editor(y)
	y.rect_min_size.y = 24
	
	# Adds a little spinner that lets the user adjust values that way
	var duration_input = EditorSpinSlider.new()
	duration_input.value = 1.0
	duration_input.min_value = 0.05
	duration_input.max_value = 10
	duration_input.step = 0.05
	_add_property("duration", duration_input)
