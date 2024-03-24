extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	if Input.is_action_just_pressed("menu"):
		get_tree().paused
func _on_StartButton_pressed():
	get_tree().change_scene("res://plosinovka.tscn")
	


func _on_ExitButton_pressed():
	get_tree().quit()
