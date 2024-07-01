extends Control

signal textbox_closed

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health(State.current_health,State.max_health, $Player/ProgressBar)
	$TextBoxPanel/Text.hide()
	display_text("joko Anwar adalah nyata")
	await self.textbox_closed

	#if $TextBoxPanel/Text.hide() == true:
		#display_text("Jalanku")
	#display_text("Jalanku")

func set_health(health, max_health, ProgressBar):
	ProgressBar.value = health
	ProgressBar.max_value = max_health

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$TextBoxPanel/Text.hide()
		
		emit_signal("textbox_closed")

func display_text(text):
	$TextBoxPanel/Text.show()
	$TextBoxPanel/Text.text = text 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_run_pressed():
	display_text("Kamu cupu")
	await self.textbox_closed
	get_tree().quit()
