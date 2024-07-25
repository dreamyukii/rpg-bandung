extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni
@onready var type = $Typewriter
const level_music = preload("res://World/music/The-Lone-Wolf(chosic.com).mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	MusicManager.play_music(level_music)
	
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
	type.play()
	textani.play("show")
	await textani.animation_finished
	textani.play_backwards("show")
	$TextBoxPanel/Text.hide()
	
	$TextBoxPanel/Text2.show()
	type.play()
	textani.play("show")
	await textani.animation_finished
	
	SceneTransition.Transit("res://scene/Scene2.tscn")
	
	#$World.visible = true
	#$Player.visible = true
	
	#emit_signal("ready")

#func



