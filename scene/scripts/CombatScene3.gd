extends Node

signal textbox_closed
signal choosed

@export var enemy: Resource = null
@export var enemyCommander: Resource = null
@onready var choose = null

var current_enemy_health = 0
var current_enemy2_health = 0
var current_player_health = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#SceneTransition.Transit("")
	SceneTransition._out()
	print("Joko")
	set_health(enemy.health, enemy.health, $Enemy/ProgressBar)
	set_health(enemyCommander.health, enemyCommander.health, $Enemy2/ProgressBar)
	set_health(State.current_health,State.max_health, $Player/ProgressBar)
	#$TextBoxPanel/Text.hide()
	
	current_enemy_health = enemy.health
	current_enemy2_health = enemyCommander.health
	current_player_health = State.current_health
	
	display_text("joko Anwar adalah nyata, %s" % enemy.health)
	await self.textbox_closed
	
	#display_text(enemyCommander.health)
	
	
	
	#if $TextBoxPanel/Text.hide() == true:
		#display_text("Jalanku")
		#print("Joko")
	

func enemy_turn():
	display_text("Kamu dihit")
	await self.textbox_closed
	current_player_health = max(0, current_player_health - enemy.damage)
	set_health(current_player_health, enemy.health, $Player/ProgressBar)

func set_health(health, max_health, ProgressBar):
	ProgressBar.value = health
	ProgressBar.max_value = max_health

func _input(_event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$TextBoxPanel/Text.hide()
		
		emit_signal("textbox_closed")
	#pass

func display_text(text):
	$TextBoxPanel/Text.show()
	$TextBoxPanel/Text.text = text 
 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_run_pressed():
	display_text("Kamu cupu")
	await self.textbox_closed
	get_tree().quit()



func _on_attack_pressed():
	display_text("Pilih Musuh")
	$AnimationPlayer.play("glow")
	await self.choosed
	if choose == 1:
		current_enemy_health = max(0, current_enemy_health - State.damage)
		set_health(current_enemy_health, enemy.health, $Enemy/ProgressBar)
	elif choose == 2:
		current_enemy2_health = max(0, current_enemy2_health - State.damage)
		set_health(current_enemy2_health, enemyCommander.health, $Enemy2/ProgressBar)
		print(current_enemy2_health)
	$AnimationPlayer.stop()
	
	
	#current_enemy_health = max(0, current_enemy_health - State.damage)
	#set_health(current_enemy_health, enemy.health, $Enemy/ProgressBar)

	#enemy_turn();



func _on_enemy_1_pressed():
	print("Joko")
	choose = 1
	emit_signal("choosed")


func _on_enemy_2_pressed():
	print(enemyCommander.health)
	choose = 2
	emit_signal("choosed")
