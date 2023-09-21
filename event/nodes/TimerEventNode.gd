extends EventNode

var duration := 1.0
var started = false

func start():
	if started: return
	started = true
	
	var timer = Global.get_tree().create_timer(duration)
	timer.connect("timeout", self, "complete")
