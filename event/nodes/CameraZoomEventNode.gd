extends EventNode
# needs a Camera2D node in a group named 'player_camera'

var zoom_input = 0.0

var duration = 0.0
var started = false

func start():
	if started: return
	started = true
	
	var camera = Global.get_tree().get_nodes_in_group("player_camera")[0]
	var tween = Tween.new()
	Global.add_child(tween)
	
	
	tween.interpolate_property(camera, "zoom", camera.zoom, Vector2(zoom_input, zoom_input), duration, Tween.EASE_IN_OUT, Tween.EASE_IN_OUT)
	tween.start()
	
	yield(Global.get_tree().create_timer(duration), "timeout")# Godot 4: await get_tree().create_timer(duration).timeout
	tween.queue_free()
