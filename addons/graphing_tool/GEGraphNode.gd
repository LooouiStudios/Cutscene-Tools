extends Node

# '_add_property' needs 

func _add_property(_a, _b, _c = false):
	pass #Does nothing. Agian you need the plugin

# Adds a get actor button to the script
func add_get_actor(element) -> void:
	element.button = Button.new()
	element.button.rect_min_size.y = 24
	element.button.text = "Get_Actor"
	var property_editor_button = _add_property("Get_Actor", element.button)
	property_editor_button.set_bottom_editor(element.button)
	element.button.connect("pressed", element, "pressed")

	element.actor = Label.new()
	var property_editor_actor = _add_property("Actor", element.actor, false)

func add_advanced(element):
	var advanced_button = Button.new()
	advanced_button.rect_min_size.y = 24
	advanced_button.text = "Advanced"
	advanced_button.connect("pressed", element, "advanced_pressed")
	element.add_child(advanced_button)

func hack_selected_nodes():
	var hack_plugin = EditorPlugin.new()
	var interface = hack_plugin.get_editor_interface()
	hack_plugin.queue_free()

	var selected_nodes = interface.get_selection().get_selected_nodes()
	var selected_node : Node = selected_nodes.pop_front()
	
	return selected_node

func hack_selected_file():
	var hack_plugin = EditorPlugin.new()
	var interface = hack_plugin.get_editor_interface()
	hack_plugin.queue_free()
	
	var selected_path = interface.get_current_path()
	return selected_path
