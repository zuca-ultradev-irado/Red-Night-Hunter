extends Area2D

var player_near := false
var player = null


func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body):
	print("ENTROU: ", body.name)

	if body is CharacterBody2D:
		player_near = true
		player = body


func _on_body_exited(body):
	print("SAIU: ", body.name)

	if body == player:
		player_near = false
		player = null


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:

			if player_near and player != null:
				print("ARMA COLETADA!")

				player.pick_up_weapon()

				queue_free()
