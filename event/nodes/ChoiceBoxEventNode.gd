extends EventNode
# needs a  node in a group named 'player' where the choicebox will be spawned

var started = false

func start():
	if started: return
	started = true
	
	var player = Global.get_tree().get_nodes_in_group("player")[0]
	var choicebox = load("res://Cutscene Manager/Elements/Choice/ChoiceBox.tscn").instance()
	player.add_child(choicebox)
	choicebox.position = Vector2(0, -12)
	choicebox.start()
	
	complete()
