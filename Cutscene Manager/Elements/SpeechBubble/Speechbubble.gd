extends Position2D

signal finished()

var actor 

onready var tween = get_node("Tween")
onready var dialog_label = get_node("Label")
onready var timer = get_node("Timer")

onready var ninepatch_rect = get_node("Label/NinePatchRect")
onready var audiostream = get_node("AudioStreamPlayer")
onready var anim = get_node("AnimationPlayer")

var prev_visible = 0
var reveal_modifier = 0.5
var old_reveal_modifier

var finished = false

var finish_after_time = 0

var wait_characters = {
	".": 0.05,
	"!": 0.1,
	"?": 0.03,
	",": 0.1,
}

func _ready():
	old_reveal_modifier = reveal_modifier

func _input(_event):
	if finish_after_time == 0:
		if Input.is_action_just_pressed("dialog_interact"):
			if dialog_label.percent_visible != 1.0:
				dialog_label.percent_visible = 1.0
				yield(get_tree().create_timer(0.1),"timeout")
			else:
				emit_signal("finished")
				anim.play("dissappear")
				yield(get_tree().create_timer(0.2),"timeout")
				queue_free()

func play_dialog(text: String):
	anim.play("appear")
	dialog_label.text = text
	
	dialog_label.percent_visible = 0.0
	prev_visible = 0

func _physics_process(_delta):
	if actor:
		global_position = actor.global_position + Vector2(0, -20)
	
	if dialog_label.percent_visible >= 1.0: return
	
	var duration = (dialog_label.text.length() / reveal_modifier) 
	
	dialog_label.percent_visible += 1 / duration
	
	var visible_count = dialog_label.visible_characters
	var no_spaces = ""
	var splits = dialog_label.text.split(" ")
	
	for split in splits:
		no_spaces += split
	
	if no_spaces[visible_count - 1] in wait_characters:
		reveal_modifier = wait_characters[no_spaces[visible_count - 1]]
	else:
		reveal_modifier = old_reveal_modifier
	
	if visible_count - prev_visible >= 1:
		audiostream.pitch_scale = rand_range(0.99, 1.01)
		audiostream.play()
		prev_visible = visible_count
	
	if dialog_label.percent_visible == 1.0:
		if finish_after_time != 0: timer.start(finish_after_time)



func _on_Timer_timeout():
	emit_signal("finished")
	anim.play("dissappear")
	yield(get_tree().create_timer(0.2),"timeout")
	queue_free()
