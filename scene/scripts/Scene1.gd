extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni
# Called when the node enters the scene tree for the first time.
func _ready():
	#await get_tree().create_timer(5).timeout
	#$World.visible = false
	#$Player.visible = false
	animation.play("out")
	await animation.animation_finished
	
	textani.play("show")
	await textani.animation_finished
	SceneTransition.Transit("res://scene/Scene2.tscn")
	
	#$World.visible = true
	#$Player.visible = true
	
	#emit_signal("ready")

#func



