extends Button

var old_text = ""


func _on_Button_pressed():
	print("PRESSED MAAAAN")


func _on_Button_mouse_entered():
	old_text = text
	text = " > " +  text


func _on_Button_mouse_exited():
	text = old_text
