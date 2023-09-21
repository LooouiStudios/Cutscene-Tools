extends EventNode

var started = false
var letterbox_enabled : bool

func start():
	if started: return
	
	started = true
	var anim = Global.get_tree().get_nodes_in_group("letterbox_anim")[0]
	var player = Global.get_tree().get_nodes_in_group("player")[0]
	if letterbox_enabled:
		anim.play("letterbox_in")
		player.can_move = false
	else:
		anim.play("letterbox_out")
		player.can_move = true
		
	complete()
