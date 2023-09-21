extends EventNode

var started = false

var Dialog = ""
var Actor = ""

var Finish_After_Time = 0.0
var actor_node

var already_false = false

func start():
	if started: return 
	started = true
	
	# Ignore this very inefficent code :/ 
	var scene = get_node("/root/").get_child(0)
	for node in Global.get_all_children(scene):
		if node.name == Actor:
			actor_node = node
	
	if Actor in NpcManager.npc_scene.keys():
		if actor_node.can_move:
			already_false = true
		actor_node.can_move = false
	
	DialogManager.play_dialog(Dialog, actor_node, Finish_After_Time)
	var _return = DialogManager.connect("finished", self, "_complete")

func _complete():
	if Actor in NpcManager.npc_scene.keys() and !already_false:
		actor_node.can_move = true
	
	complete()
