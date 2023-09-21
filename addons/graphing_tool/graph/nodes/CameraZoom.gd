extends GEGraphNode


func _ready():
	title = "Zoom Camera"
	rect_min_size = Vector2(12 * 24, 3 * 24)
	show_close = true
	set_slot(0, true, 0, Color.white, true, 0, Color.white)
	
	var zoom_input = EditorSpinSlider.new()
	zoom_input.value = 1.0
	zoom_input.min_value = 0.05
	zoom_input.max_value = 10
	zoom_input.step = 0.05
	_add_property("zoom_input", zoom_input)
	
	var duration_input = EditorSpinSlider.new()
	duration_input.value = 1.0
	duration_input.min_value = 0.05
	duration_input.max_value = 10
	duration_input.step = 0.05
	_add_property("duration", duration_input)
