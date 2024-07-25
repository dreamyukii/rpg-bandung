extends Node

@onready var animation = $AnimationPlayer
@onready var textani = $TextBoxPanel/TextAni

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	await get_tree().create_timer(6).timeout
	SceneTransition.Transit("res://scene/main_menu.tscn")

