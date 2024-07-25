extends Node

signal textbox_closed
signal choosed
signal turnend

@export var enemy: Resource = null
@export var enemyCommander: Resource = null
@onready var choose = null
@onready var slash = $Slash
@onready var slash2 = $Slash2

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
	
	display_text("Bersiaplah!")
	await self.textbox_closed

func _process(delta):
	if current_enemy2_health == -1 && current_enemy_health == -1:
		SceneTransition.Transit("res://scene/Scene4.tscn")
	if current_player_health <= 0:
		display_text("Kamu Tumbang")
		await self.textbox_closed
		SceneTransition.Transit("res://scene/main_menu.tscn")


func set_health(health, max_health, ProgressBar):
	ProgressBar.value = health
	ProgressBar.max_value = max_health


func _input(_event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$TextBoxPanel/Text.hide()
		
		emit_signal("textbox_closed")


func display_text(text):
	$TextBoxPanel/Text.show()
	$TextBoxPanel/Text.text = text 


func _on_run_pressed():
	display_text("Kamu kabur")
	await self.textbox_closed
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")

func _on_defend_pressed():
	if current_enemy_health > 0:
		current_player_health = max(0, current_player_health - (enemy.damage)*0.2)
		set_health(current_player_health, State.max_health, $Player/ProgressBar)
		slash2.play()
		display_text("Kamu berhasil defense")
		await self.textbox_closed
	if current_enemy2_health > 0:
		current_player_health = max(0, current_player_health - (enemyCommander.damage)*0.2)
		set_health(current_player_health, State.max_health, $Player/ProgressBar)
		slash2.play()
		display_text("Kamu berhasil defense")
	

func _on_attack_pressed():
	display_text("Pilih Musuh")
	$AnimationPlayer.play("glow")
	await self.choosed
	if choose == 1 && current_enemy_health >0:
		current_enemy_health = max(0, current_enemy_health - State.damage)
		set_health(current_enemy_health, enemy.health, $Enemy/ProgressBar)
		display_text("Kamu hit sebanyak 30")
		slash.play()
	elif choose == 2 && current_enemy2_health >0:
		current_enemy2_health = max(0, current_enemy2_health - State.damage)
		set_health(current_enemy2_health, enemyCommander.health, $Enemy2/ProgressBar)
		display_text("Kamu hit sebanyak 30")
		slash.play()
	else:
		display_text("Lawan sudha mati")
	$AnimationPlayer.stop()
	
	await self.textbox_closed
	enemy_turn()
	await self.textbox_closed
	enemy2_turn()
	
	
func enemy_turn():
	if current_enemy_health > 0:
		display_text("Kamu diserang Enemy sebanyak 10 dmg")
		slash2.play()
		$AnimationPlayer.play("shake")
		await self.textbox_closed
		current_player_health = max(0, current_player_health - enemy.damage)
		set_health(current_player_health, State.max_health, $Player/ProgressBar)
		
	elif current_enemy_health == 0:
			$AnimationPlayer.play("enemyfall")
			current_enemy_health = -1
			display_text("Enemy mati")
			emit_signal("textbox_closed")
	elif current_enemy_health == -1:
		display_text("Enemy sudah mati, tidak dapat menyerang")
	
	
func enemy2_turn():
	if current_enemy2_health > 0:
		display_text("Kamu diserang Enemy Commander sebanyak 15 dmg")
		slash2.play()
		$AnimationPlayer.play("shake")
		await self.textbox_closed
		current_player_health = max(0, current_player_health - enemyCommander.damage)
		set_health(current_player_health, State.max_health, $Player/ProgressBar)
		
	elif current_enemy2_health == 0:
			$AnimationPlayer.play("enemy2fall")
			current_enemy2_health = -1
			display_text("Enemy Commander mati")
	elif current_enemy2_health == -1:
		pass


func _on_enemy_1_pressed():
	choose = 1
	emit_signal("choosed")


func _on_enemy_2_pressed():
	choose = 2
	emit_signal("choosed")




