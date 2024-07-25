extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni
@onready var type = $Typewriter

const battle_music = preload("res://World/music/scott-buckley-permafrost(chosic.com).mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.play_music(battle_music, -85)
	$TextBoxPanel/Text2.hide()
	$TextBoxPanel/Text.hide()
	animation.play("out")
	await animation.animation_finished
	
	$TextBoxPanel/Text.show()
	type.play()
	textani.play("show")
	await textani.animation_finished
	textani.play_backwards("show")
	$TextBoxPanel/Text.hide()
	
	$TextBoxPanel/Text2.show()
	type.play()
	textani.play("show")
	await textani.animation_finished
	
	SceneTransition.Transit("res://scene/CombatScene3.tscn")
