
extends Control

@export var game_scene: PackedScene
@export var main_menu_scene: PackedScene

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()

	$ResumeButton.pressed.connect(_on_resume_pressed)
	$RestartButton.pressed.connect(_on_restart_pressed)
	$MenuButton.pressed.connect(_on_menu_pressed)

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()
		get_viewport().set_input_as_handled()

func toggle_pause():
	var paused = not get_tree().paused
	get_tree().paused = paused
	visible = paused

func _on_resume_pressed():
	get_tree().paused = false
	hide()

func _on_restart_pressed():
	get_tree().paused = false

	if game_scene != null:
		get_tree().change_scene_to_packed(game_scene)
	else:
		get_tree().reload_current_scene()

func _on_menu_pressed():
	get_tree().paused = false

	if main_menu_scene != null:
		get_tree().change_scene_to_packed(main_menu_scene)
