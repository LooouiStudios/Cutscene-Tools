extends GEGraphNode

func _ready():
	title = "End"
	rect_min_size = Vector2(8 * 24, 3 * 24)
	show_close = true
	set_slot(0, true, 0, Color.white, false, 0, Color.white)
	
	var label = Label.new()
	label.text = "End Event"
	label.align = Label.ALIGN_CENTER
	label.size_flags_vertical = label.SIZE_SHRINK_CENTER
	add_child(label)
