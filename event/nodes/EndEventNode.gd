extends EventNode

var started = false

func start():
	if started: return
	started = true
	
	complete()
