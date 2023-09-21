extends Position2D

onready var anim = get_node("AnimationPlayer")

onready var vbox = get_node("VBoxContainer")
onready var ninepatch = get_node("NinePatchRect")

func start():
	anim.play("appear")
	yield(get_tree().create_timer(0.015),"timeout")
	ninepatch.rect_size = vbox.rect_size + Vector2(20, 10)
	vbox.rect_size += Vector2(20, 10)
	ninepatch.rect_position = vbox.rect_position
	
	global_position.y -= vbox.rect_size.y /1.5
	global_position.x += vbox.rect_size.x / 5

func end():
	anim.play("dissappear")
	yield(get_tree().create_timer(0.2),"timeout")
	queue_free()
