extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni

# Called when the node enters the scene tree for the first time.
func _ready():
	
	textani.play("fill1")
	print("1")
	await textani.animation_finished
	textani.play("fill2")
	print("2")
	await textani.animation_finished
	
	SceneTransition.Transit("res://scene/Credit.tscn")

