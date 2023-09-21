extends GEGraphNode
# This node uses the functions 'add_get_actor', 'add_advanced' and 'hack_selected_nodes'
# They must be added to the GEGraphNode.
# The code for these functions are in a script named GEGraphNode, but they only contain those functions

var actor
var button

var dialog
var label

var speechbubble
var show_speechbubble
var scale_x

var property_editor_speechbubble
var property_editor_scale_X

var finish_based_on_time 
var time

var items = []

var advanced_items = []
var advanced = false

func _ready():
	title = "Dialog"
	rect_min_size = Vector2(12 * 24, 8 * 24)
	show_close = true
	set_slot(0, true, 0, Color.white, true, 0, Color.white)
	
	add_get_actor(self)
	items.append(button)
	
	dialog = TextEdit.new()
	dialog.wrap_enabled = true
	var property_editor_text = _add_property("Dialog", dialog)
	property_editor_text.set_bottom_editor(dialog)
	dialog.rect_min_size.y = 72
	items.append(dialog)
	
	add_advanced(self)
	
	scale_x = EditorSpinSlider.new()
	scale_x.value = 68
	scale_x.min_value = 1
	scale_x.max_value = 100
	scale_x.step = 0.05
	_add_property("X Scale", scale_x, true)
	
	var camera = CheckBox.new()
	_add_property("Do_Zoom", camera, true)
	
	time = EditorSpinSlider.new()
	time.value = 0
	time.min_value = 0
	time.max_value = 10
	time.step = 0.05
	_add_property("Finish_After_Time", time, true)
	
	if actor.text != "": 
		button.text = actor.text
	
	speechbubble = load("res://Cutscene Manager/Elements/SpeechBubble/Speechbubble.tscn").instance()
	add_child(speechbubble)
	speechbubble.scale = Vector2(4,4)
	speechbubble.position = Vector2(0, -50)
	
	speechbubble.hide()

func pressed():
	if hack_selected_nodes().name == "NPC_Manager":
		actor.text = hack_selected_nodes().npc
	else:
		actor.text = hack_selected_nodes().name
	
	button.text = actor.text

var old_rect_size_y

func advanced_pressed():
	advanced = !advanced
	
	if advanced:
		old_rect_size_y = rect_size.y
		
		var label_1 = Label.new()
		label_1.text = "Speechbubble rect_scale"
		add_child(label_1)
		advanced_items.append(label_1)
		
		var scale_slider = EditorSpinSlider.new()
		scale_slider.value = scale_x.value
		scale_slider.min_value = 1
		scale_slider.max_value = 100
		scale_slider.step = 0.05
		add_child(scale_slider)
		advanced_items.append(scale_slider)
		
		var label_2 = Label.new()
		label_2.text = "Finish after time"
		add_child(label_2)
		advanced_items.append(label_2)
		
		var _time = EditorSpinSlider.new()
		_time.value = time.value
		_time.min_value = 0
		_time.max_value = 10
		_time.step = 0.5
		add_child(_time)
		advanced_items.append(_time)
		
		speechbubble.show()
	else:
		var index = 0
		for advanced_item in advanced_items.size():
			if is_instance_valid(advanced_items[advanced_item - index]): 
				advanced_items[advanced_item - index].queue_free()
			advanced_items.remove(advanced_item - index)
			index += 1
		
		speechbubble.hide()

func _process(delta):
	if advanced_items.size() != 0:
		for advanced_item in advanced_items:
			if advanced_item == null: 
				print("is null")
				advanced_items.remove(advanced_items.find(advanced_item))
		
		if is_instance_valid(advanced_items[1]):
			scale_x.value = advanced_items[1].value
		
		if is_instance_valid(advanced_items[3]):
			time.value = advanced_items[3].value
	
	rect_size.y -= 100
	var label = speechbubble.get_node("Label")
	
	var position = Vector2(-2, 0)
	position.y += -(label.get_visible_line_count() * 14)
	
	
	label.rect_position = position
	label.rect_size.x = scale_x.value
	
	label.text = dialog.text
	label.rect_size.y = 0
