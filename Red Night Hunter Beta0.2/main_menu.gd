
extends Control

@export var game_scene: PackedScene


func _ready():
	$PlayButton.pressed.connect(_on_play_pressed)
	$QuitButton.pressed.connect(_on_quit_pressed)


func _on_play_pressed():
	if game_scene != null:
		get_tree().change_scene_to_packed(game_scene)
	else:
		print("ERRO: selecione a cena do jogo no Inspetor.")


func _on_quit_pressed():
	get_tree().quit()
