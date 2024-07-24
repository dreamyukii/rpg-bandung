#extends Control
#
#signal textbox_closed
#
#@export var enemy: Resource = null
#@export var enemyCommander: Resource = null
#
#var current_enemy_health = 0
#var current_player_health = 0
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#set_health(enemy.health, enemy.health, $Enemy/ProgressBar)
	#set_health(50, enemyCommander.health, $Enemy2/ProgressBar)
	#set_health(State.current_health,State.max_health, $Player/ProgressBar)
	#$TextBoxPanel/Text.hide()
	#
	#current_enemy_health = enemy.health
	#current_player_health = State.current_health
	#
	#display_text("joko Anwar adalah nyata, %s" % enemy.health)
	#await self.textbox_closed
#
	##if $TextBoxPanel/Text.hide() == true:
		##display_text("Jalanku")
	##display_text("Jalanku")
#
##func set_health(health, max_health, ProgressBar):
	##ProgressBar.value = health
	##ProgressBar.max_value = max_health
#
#func _input(_event):
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		#$TextBoxPanel/Text.hide()
		#
		#emit_signal("textbox_closed")
#
#func display_text(text):
	#$TextBoxPanel/Text.show()
	#$TextBoxPanel/Text.text = text 
## Called every frame. 'delta' is the elapsed time since the previous frame.
##func _process(delta):
	##pass
#
#
#func _on_run_pressed():
	#display_text("Kamu cupu")
	#await self.textbox_closed
	#get_tree().quit()
#
#
#func _on_attack_pressed():
	#display_text("Kamu gay")
	#await self.textbox_closed
	#
	#current_enemy_health = max(0, current_enemy_health - State.damage)
	#set_health(current_enemy_health, enemy.health, $Enemy/ProgressBar)
