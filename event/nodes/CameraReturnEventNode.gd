extends EventNode
# needs a Camera2D node in a group named 'player_camera'

var started = false

func start():
	if started: return
	started = true
	
	var camera = Global.get_tree().get_nodes_in_group("player_camera")[0]
	camera.position = Vector2.ZERO
	
	var tween = Tween.new()
	Global.add_child(tween)
	
	tween.interpolate_property(camera, "zoom", camera.zoom, Vector2(1.3, 1.3), 1, Tween.EASE_IN_OUT, Tween.EASE_IN_OUT)
	tween.start()
	print("Tween started")
	
	yield(Global.get_tree().create_timer(1), "timeout")# Godot 4: await get_tree().create_timer(1).timeout
	tween.queue_free()
	complete()
