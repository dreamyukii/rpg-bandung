extends Control

#@onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#SceneTransition.SceneTransit("res://scene/scene1.tscn")
	pass

func _on_play_pressed():
	#SceneTransition._in("res://scene/scene1.tscn")
	SceneTransition.Transit("res://scene/Scene1.tscn")
	
	
	

