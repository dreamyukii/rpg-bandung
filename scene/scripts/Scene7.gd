extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextBoxPanel/Text2.hide()
	$TextBoxPanel/Text.hide()
	animation.play("out")
	await animation.animation_finished
	
	$TextBoxPanel/Text.show()
	textani.play("show")
	type.play()
	await textani.animation_finished
	textani.play_backwards("show")
	$TextBoxPanel/Text.hide()
	
	$TextBoxPanel/Text2.show()
	textani.play("show")
	type.play()
	await textani.animation_finished
	
	SceneTransition.Transit("res://scene/CombatScene7.tscn")
