extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni
@onready var fire = $AudioStreamPlayer
@onready var type = $Typewriter

# Called when the node enters the scene tree for the first time.
func _ready():
	fire.play()
	$TextBoxPanel/Text2.hide()
	$TextBoxPanel/Text.hide()
	textani.play("fill1")
	print("1")
	await textani.animation_finished
	textani.play("fill2")
	print("2")
	await textani.animation_finished
	animation.play("out")
	await animation.animation_finished
	
	
	$TextBoxPanel/Text.show()
	textani.play("show")
	type.play()
	await textani.animation_finished
	textani.play_backwards("show")
	$TextBoxPanel/Text.hide()
	
	$TextBoxPanel/Text2.show()
	type.play()
	textani.play("show2")
	await textani.animation_finished
	
	SceneTransition.Transit("res://scene/Ending.tscn")
