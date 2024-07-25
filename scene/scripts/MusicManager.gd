extends Node

@onready var audio_player_1 = $"/root/MusicManager/AudioStreamPlayer1"
@onready var audio_player_2 = $"/root/MusicManager/AudioStreamPlayer2"

const level_music = preload("res://World/music/The-Lone-Wolf(chosic.com).mp3")
const battle_music = preload("res://World/music/scott-buckley-permafrost(chosic.com).mp3")
const fire_music = preload("res://World/music/dark-forest(chosic.com).mp3")

var current_player: AudioStreamPlayer = null
var next_player: AudioStreamPlayer = null
var fade_duration = 2.0 # Duration of the fade effect
var volume_step = 0.1 # Step for volume change
var timer: Timer = null

func _ready():
	current_player = audio_player_1
	next_player = audio_player_2
	print("Audio Players Initialized")

func _play(music: AudioStream, volume = -20.0): # Default volume set to -20 dB
	if current_player and current_player.stream == music:
		return
	
	print("Playing music: ", music)
	
	if next_player:
		next_player.stream = music
		next_player.volume_db = volume # Set the initial volume to a moderate level
		next_player.play()
		print("Next player started")
	
		timer = Timer.new()
		timer.wait_time = volume_step
		timer.one_shot = false
		timer.connect("timeout", Callable(self, "_on_fade_timer_timeout"))
		add_child(timer)
		timer.start()

func _on_fade_timer_timeout():
	if not current_player or not next_player:
		return

	var fade_step = 80 / (fade_duration / volume_step)
	current_player.volume_db += fade_step * -1
	next_player.volume_db += fade_step
	
	if current_player.volume_db <= -80:
		current_player.stop()
		var temp = current_player
		current_player = next_player
		next_player = temp
		next_player.volume_db = -80
		next_player.stream = null
		next_player.stop()
		timer.stop()

func play_music(music: AudioStream, volume = -100.0): # Default volume set to -20 dB
	_play(music, volume)
