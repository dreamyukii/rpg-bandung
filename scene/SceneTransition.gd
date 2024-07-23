extends CanvasLayer

@onready var animation = $AnimationPlayer

func Transit(scenePath):
	animation.play("Disolve")
	await animation.animation_finished
	get_tree().change_scene_to_file(scenePath)
	animation.play_backwards("Disolve")
	
func _out():
	animation.play_backwards("Disolve")
