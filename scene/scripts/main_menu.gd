extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_play_pressed():
	SceneTransition.Transit("res://scene/Scene1.tscn")
	
func _on_about_pressed():
	SceneTransition.Transit("res://scene/about.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
	
	
	

