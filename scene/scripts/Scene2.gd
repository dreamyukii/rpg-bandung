extends Node

#@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni
# Called when the node enters the scene tree for the first time.
func _ready():
	#animation.play("_out")
	#await animation.animation_finished
	print("Joko")
	textani.play("show")
	print("Joko")
	await textani.animation_finished
	print("Joko")
	#SceneTransition.Transit("res://scene/Scene2.tscn")
