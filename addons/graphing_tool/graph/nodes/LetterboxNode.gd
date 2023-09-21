extends GEGraphNode

func _ready():
	title = "Letterbox"
	rect_min_size = Vector2(14 * 24, 3 * 24)
	show_close = true
	set_slot(0, true, 0, Color.white, true, 0, Color.white)
	
	var letterbox_enabled = CheckBox.new()
	_add_property("letterbox_enabled", letterbox_enabled)
