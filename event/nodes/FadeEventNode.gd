extends EventNode

var started = false
var fade_in : bool

func start():
	if started: return
	started = true
	
	var anim = Global.get_tree().get_nodes_in_group("fade_anim")[0]
	if fade_in:
		anim.play("fade_in")
	else:
		anim.play("fade_out") 
	complete()
