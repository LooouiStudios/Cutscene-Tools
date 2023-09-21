extends EventNode
# needs a Camera2D node in a group named 'player_camera'

var x = 0.0
var y = 0.0

var duration = 0.0

var started = false

func start():
	if started: return
	started = true
	
	var camera = Global.get_tree().get_nodes_in_group("player_camera")[0]
	var tween = Tween.new()
	Global.add_child(tween)
	# Tweens need to be adjusted for Godot 4
	tween.interpolate_property(camera, "global_position", camera.global_position, Vector2(x, y), duration, Tween.EASE_IN_OUT, Tween.EASE_IN_OUT)
	tween.start()
	
	yield(Global.get_tree().create_timer(duration), "timeout") # Godot 4: await get_tree().create_timer(duration).timeout
	tween.queue_free()
	complete()
