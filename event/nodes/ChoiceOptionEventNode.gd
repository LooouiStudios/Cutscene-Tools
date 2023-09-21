extends EventNode
# the node within group 'choice_option_vbox' will be spawned by the choicebox

var started = false
var option = ""

func start():
	if started: return
	started = true
	
	var vbox = Global.get_tree().get_nodes_in_group("choice_option_vbox")[0]
	var choice = load("res://Cutscene Manager/Elements/Choice/ChoiceOption.tscn").instance()
	choice.text = option
	
	vbox.add_child(choice)
	choice.connect("pressed", self, "_complete")

func _complete():
	Global.get_tree().get_nodes_in_group("choice_option_vbox")[0].get_parent().end()
	complete()
