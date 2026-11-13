
extends Area2D

var player_near := false
var player = null

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.has_method("pick_up_weapon"):
		player_near = true
		player = body
		print("JOGADOR PERTO DO ITEM")

func _on_body_exited(body):
	if body == player:
		player_near = false
		player = null
		print("JOGADOR SAIU DO ITEM")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if player_near and is_instance_valid(player):
				player.pick_up_weapon()
				queue_free()
				print("ARMA COLETADA")
